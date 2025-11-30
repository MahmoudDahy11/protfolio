import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/constants.dart';
import '../cubit/contact_cubit.dart';
import 'animation_card.dart';
import 'contact/contact_form.dart';
import 'contact/contact_item.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit(),
      child: const _ContactSectionContent(),
    );
  }
}

class _ContactSectionContent extends StatelessWidget {
  const _ContactSectionContent();

  void _showNotification(
    BuildContext context, {
    required String message,
    required bool isError,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: GoogleFonts.inter(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: isError ? Colors.red[700] : Colors.green[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'DISMISS',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state is ContactSuccess) {
          _showNotification(context, message: state.message, isError: false);
          // Form clearing is handled within ContactForm
          context.read<ContactCubit>().reset();
        } else if (state is ContactError) {
          _showNotification(context, message: state.message, isError: true);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          children: [
            // Section Title
            Text(
              'Contact Me',
              style: theme.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2, end: 0),

            const SizedBox(height: 50),

            // Contact Info Cards
            AnimationCard(
                  width: 600,
                  child: Column(
                    children: [
                      ContactItem(
                        icon: Icons.email,
                        title: 'Email',
                        value: AppConstants.email,
                        onTap: () => launchUrl(
                          Uri.parse('mailto:${AppConstants.email}'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ContactItem(
                        icon: Icons.phone,
                        title: 'Phone',
                        value: AppConstants.phone,
                        onTap: () =>
                            launchUrl(Uri.parse('tel:${AppConstants.phone}')),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .slideY(begin: 0.2, end: 0),

            const SizedBox(height: 50),

            // Contact Form
            AnimationCard(width: 600, child: const ContactForm())
                .animate()
                .fadeIn(duration: 600.ms, delay: 400.ms)
                .slideY(begin: 0.2, end: 0),
          ],
        ),
      ),
    );
  }
}
