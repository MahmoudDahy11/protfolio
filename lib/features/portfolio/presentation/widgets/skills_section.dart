import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../cubit/portfolio_cubit.dart';
import '../cubit/portfolio_state.dart';
import 'animation_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Skills',
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          BlocBuilder<PortfolioCubit, PortfolioState>(
            builder: (context, state) {
              if (state is PortfolioLoaded) {
                return Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: state.skills.map((skill) {
                    return AnimationCard(
                      width: 150,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Placeholder for icon since we don't have assets yet
                          Icon(
                            Icons.code,
                            size: 40,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            skill.name,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          LinearProgressIndicator(
                            value: skill.proficiency,
                            backgroundColor: Colors.grey.withValues(alpha: .2),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ).animate().scale(
                      duration: 400.ms,
                      curve: Curves.elasticOut,
                    );
                  }).toList(),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
