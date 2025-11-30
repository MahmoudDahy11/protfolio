import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/portfolio_cubit.dart';
import '../widgets/about_section.dart';
import '../widgets/certificates_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/mobile_drawer.dart';
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
  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<PortfolioCubit>().loadPortfolioData();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    int newIndex = 0;
    for (int i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i].currentContext;
      if (context != null) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final Offset position = box.localToGlobal(Offset.zero);
        // Check if the section top is above a certain threshold (e.g., 1/3 of screen)
        // This means the section is "active" or we've scrolled past its start.
        // We want the last section that satisfies this.
        if (position.dy <= MediaQuery.of(context).size.height / 3) {
          newIndex = i;
        }
      }
    }

    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  void _scrollToSection(int index) {
    setState(() {
      _currentIndex = index;
    });
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
      endDrawer: MobileDrawer(
        onNavItemTap: _scrollToSection,
        selectedIndex: _currentIndex,
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: ParticleBackground()),
          Column(
            children: [
              NavBar(
                onNavItemTap: _scrollToSection,
                selectedIndex: _currentIndex,
              ),
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
                      CertificatesSection(key: _sectionKeys[4]),
                      ContactSection(key: _sectionKeys[5]),
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
