import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/theme_cubit.dart';

class MobileDrawer extends StatelessWidget {
  final Function(int) onNavItemTap;
  final int selectedIndex;

  const MobileDrawer({
    super.key,
    required this.onNavItemTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final navItems = ['Home', 'About', 'Skills', 'Projects', 'Contact'];

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          ...List.generate(navItems.length, (index) {
            final isSelected = selectedIndex == index;
            return ListTile(
              title: Text(
                navItems[index],
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: isSelected ? AppTheme.primaryColor : null,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close drawer
                onNavItemTap(index);
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 5,
              ),
            );
          }),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                const Text('Switch Theme'),
                const Spacer(),
                IconButton(
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
