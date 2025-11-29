import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/services/emailjs_service.dart';
import '../../../../core/services/spam_prevention_service.dart';

part 'contact_state.dart';

/// Cubit for managing contact form state and submission
class ContactCubit extends Cubit<ContactState> {
  final EmailJSService _emailService;
  final SpamPreventionService _spamService;

  ContactCubit({
    EmailJSService? emailService,
    SpamPreventionService? spamService,
  }) : _emailService = emailService ?? EmailJSService(),
       _spamService = spamService ?? SpamPreventionService(),
       super(ContactInitial());

  /// Submits the contact form
  Future<void> submitForm({
    required String name,
    required String email,
    required String message,
  }) async {
    emit(ContactSubmitting());

    try {
      // Check if EmailJS is configured
      if (!_emailService.isConfigured()) {
        emit(
          const ContactError(
            'EmailJS is not configured. Please check the setup instructions in emailjs_service.dart',
          ),
        );
        return;
      }

      // Check for duplicate message
      final isDuplicate = await _spamService.isDuplicate(message);
      if (isDuplicate) {
        emit(
          const ContactError(
            'This message has already been sent. Please send a different message.',
          ),
        );
        return;
      }

      // Check spam prevention
      final canSubmit = await _spamService.canSubmit();
      if (!canSubmit['allowed']) {
        emit(ContactError(canSubmit['message']));
        return;
      }

      // Send email via EmailJS
      final success = await _emailService.sendEmail(
        name: name,
        email: email,
        message: message,
      );

      if (success) {
        // Record submission to prevent spam
        await _spamService.recordSubmission();
        await _spamService.recordMessage(message);

        emit(
          const ContactSuccess(
            'Thank you for your message! I\'ll get back to you soon.',
          ),
        );
      } else {
        emit(
          const ContactError('Failed to send message. Please try again later.'),
        );
      }
    } catch (e) {
      emit(ContactError('An error occurred: ${e.toString()}'));
    }
  }

  /// Resets the form to initial state
  void reset() {
    emit(ContactInitial());
  }
}
