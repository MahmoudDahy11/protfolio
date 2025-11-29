part of 'contact_cubit.dart';

/// Base state for contact form
abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

/// Initial state - form is ready to be filled
class ContactInitial extends ContactState {}

/// Form is being submitted
class ContactSubmitting extends ContactState {}

/// Form submitted successfully
class ContactSuccess extends ContactState {
  final String message;

  const ContactSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

/// Form submission failed
class ContactError extends ContactState {
  final String message;

  const ContactError(this.message);

  @override
  List<Object?> get props => [message];
}
