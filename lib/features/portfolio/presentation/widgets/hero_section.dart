import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio/core/utils/assets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/constants.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onCtaTap;

  const HeroSection({super.key, required this.onCtaTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfileImage(),
                const SizedBox(height: 40),
                _buildTextContent(context),
              ],
            )
          : Row(
              children: [
                Expanded(child: _buildTextContent(context)),
                Expanded(child: Center(child: _buildProfileImage())),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, I\'m',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppTheme.accentColor),
        ).animate().fadeIn(duration: 600.ms).slideX(),
        Text(
          AppConstants.name,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(),
        const SizedBox(height: 10),
        Text(
          AppConstants.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ).animate().fadeIn(delay: 400.ms).slideX(),
        const SizedBox(height: 20),
        Text(
          AppConstants.tagline,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
        ).animate().fadeIn(delay: 600.ms).slideX(),
        const SizedBox(height: 40),
        Row(
          children: [
            ElevatedButton(
              onPressed: onCtaTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'View Projects',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 20),
            OutlinedButton(
              onPressed: () => launchUrl(Uri.parse(AppConstants.cvUrl)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                side: const BorderSide(color: AppTheme.accentColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Download CV',
                style: TextStyle(color: AppTheme.accentColor),
              ),
            ),
          ],
        ).animate().fadeIn(delay: 800.ms).scale(),
        const SizedBox(height: 30),
        Row(
          children: [
            _SocialIcon(
              icon: FontAwesomeIcons.github,
              url: AppConstants.githubUrl,
            ),
            _SocialIcon(
              icon: FontAwesomeIcons.linkedin,
              url: AppConstants.linkedinUrl,
            ),
            _SocialIcon(icon: Icons.email, url: 'mailto:${AppConstants.email}'),
          ],
        ).animate().fadeIn(delay: 1000.ms),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Center(
          child: CircleAvatar(
            radius: 150,
            backgroundColor: AppTheme.primaryColor,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: .5),
                    blurRadius: 50,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 140,
                backgroundImage: AssetImage(Assets.profileProtfolio),
              ),
            ),
          ),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .moveY(
          begin: 0,
          end: -20,
          duration: 2.seconds,
          curve: Curves.easeInOut,
        );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: IconButton(
        icon: FaIcon(icon, size: 30),
        onPressed: () => launchUrl(Uri.parse(url)),
        color: Theme.of(context).iconTheme.color,
      ).animate().scale(delay: 1200.ms),
    );
  }
}
