import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../cubit/portfolio_cubit.dart';
import '../cubit/portfolio_state.dart';
import 'animation_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Projects',
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          BlocBuilder<PortfolioCubit, PortfolioState>(
            builder: (context, state) {
              if (state is PortfolioLoaded) {
                return Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: state.projects.map((project) {
                    return AnimationCard(
                      width: 350,
                      onTap: () => launchUrl(Uri.parse(project.projectUrl)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: .1),
                              borderRadius: BorderRadius.circular(15),
                              image: project.imageUrl != null
                                  ? DecorationImage(
                                      image: AssetImage(project.imageUrl!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: project.imageUrl == null
                                ? const Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            project.name,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            project.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: project.technologies.map((tech) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary.withValues(alpha: .1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  tech,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
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
