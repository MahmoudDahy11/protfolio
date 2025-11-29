import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/portfolio_cubit.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/particle_background.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    context.read<PortfolioCubit>().loadPortfolioData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: ParticleBackground()),
          Column(
            children: [
              NavBar(onNavItemTap: _scrollToSection),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HeroSection(
                        key: _sectionKeys[0],
                        onCtaTap: () => _scrollToSection(3),
                      ),
                      AboutSection(key: _sectionKeys[1]),
                      SkillsSection(key: _sectionKeys[2]),
                      ProjectsSection(key: _sectionKeys[3]),
                      ContactSection(key: _sectionKeys[4]),
                      const SizedBox(height: 50), // Footer padding
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
