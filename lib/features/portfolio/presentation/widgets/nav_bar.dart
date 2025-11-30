import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/theme_cubit.dart';

class NavBar extends StatelessWidget {
  final Function(int) onNavItemTap;
  final int selectedIndex;

  const NavBar({
    super.key,
    required this.onNavItemTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final navItems = [
      'Home',
      'About',
      'Skills',
      'Projects',
      'Certificates',
      'Contact',
    ];

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
                ...List.generate(navItems.length, (index) {
                  return _NavItem(
                    title: navItems[index],
                    isSelected: selectedIndex == index,
                    onTap: () => onNavItemTap(index),
                  );
                }),
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
  final bool isSelected;

  const _NavItem({
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected ? AppTheme.primaryColor : null,
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color: AppTheme.primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
