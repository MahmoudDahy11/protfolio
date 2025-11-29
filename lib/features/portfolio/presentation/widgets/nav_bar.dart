import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/theme_cubit.dart';

class NavBar extends StatelessWidget {
  final Function(int) onNavItemTap;

  const NavBar({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: .8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'MD.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                _NavItem(title: 'Home', onTap: () => onNavItemTap(0)),
                _NavItem(title: 'About', onTap: () => onNavItemTap(1)),
                _NavItem(title: 'Skills', onTap: () => onNavItemTap(2)),
                _NavItem(title: 'Projects', onTap: () => onNavItemTap(3)),
                _NavItem(title: 'Contact', onTap: () => onNavItemTap(4)),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                ),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Open drawer or modal for mobile menu
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
