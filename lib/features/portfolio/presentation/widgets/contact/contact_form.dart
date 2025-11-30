import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../cubit/contact_cubit.dart';
import 'custom_text_field.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<ContactCubit>().submitForm(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        message: _messageController.text.trim(),
      );
    }
  }

  // Exposed to parent if needed, or we can listen to state changes to clear
  void clearForm() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state is ContactSuccess) {
          clearForm();
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send me a message',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _nameController,
              label: 'Name',
              hint: 'Enter your name',
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                if (value.trim().length < 2) {
                  return 'Name must be at least 2 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _emailController,
              label: 'Email',
              hint: 'Enter your email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegex.hasMatch(value.trim())) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _messageController,
              label: 'Message',
              hint: 'Enter your message',
              icon: Icons.message_outlined,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your message';
                }
                if (value.trim().length < 10) {
                  return 'Message must be at least 10 characters';
                }
                if (value.trim().length > 1000) {
                  return 'Message must not exceed 1000 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            BlocBuilder<ContactCubit, ContactState>(
              builder: (context, state) {
                final isSubmitting = state is ContactSubmitting;

                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isSubmitting ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      disabledBackgroundColor: AppTheme.primaryColor
                          .withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 8,
                      shadowColor: AppTheme.primaryColor.withOpacity(0.4),
                    ),
                    child: isSubmitting
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Sending...',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.send, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Send Message',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ).animate().shimmer(
              duration: 2000.ms,
              delay: 1000.ms,
              color: Colors.white.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
