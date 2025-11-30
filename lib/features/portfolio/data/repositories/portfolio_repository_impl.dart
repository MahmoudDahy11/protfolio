import '../../domain/entities/certificate.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../models/certificate_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../../../../core/utils/assets.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  @override
  Future<List<Project>> getProjects() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    return const [
      ProjectModel(
        name: 'Suits App',
        description:
            'A sleek and stylish app for browsing, shopping, and managing your wardrobe with ease.',
        technologies: [
          'Flutter',
          'Clean Architecture',
          'Cubit',
          'Firebase',
          'Rest API',
          'local storage',
          'Push Notifications',
        ],
        projectUrl: 'https://github.com/MahmoudDahy11/suits',
        imageUrl: Assets.suitsProtfolio,
      ),
      ProjectModel(
        name: 'Fruits App',
        description:
            'An intuitive app to explore, track, and enjoy a wide variety of fruits with detailed info and tips.',
        technologies: ['Flutter', 'Hive', 'Cubit', 'Firebase', 'localization'],
        projectUrl: 'https://github.com/MahmoudDahy11/Fruits',
        imageUrl: Assets.fruitsProtfolio,
      ),
      ProjectModel(
        name: 'Weather Forecast',
        description:
            'Real-time weather updates using OpenWeatherMap API with beautiful animations.',
        technologies: ['Flutter', 'REST API', 'Cubit', 'MVVM'],
        projectUrl: 'https://github.com/MahmoudDahy11/weather-app',
        imageUrl: Assets.weatherProtfolio,
      ),
      ProjectModel(
        name: 'Bookly',
        description:
            'A smart app to discover, track, and manage your reading journey with personalized recommendations, all available for free download.',
        technologies: ['Flutter', 'REST API', 'Cubit', 'MVVM'],
        projectUrl: 'https://github.com/MahmoudDahy11/bookly-app',
        imageUrl: Assets.booklyProtfolio2,
      ),
    ];
  }

  @override
  Future<List<Skill>> getSkills() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const [
      SkillModel(
        name: 'Flutter',
        iconPath: 'assets/icons/flutter.png',
        proficiency: 0.95,
      ),
      SkillModel(
        name: 'Dart',
        iconPath: 'assets/icons/dart.png',
        proficiency: 0.95,
      ),
      SkillModel(
        name: 'Firebase',
        iconPath: 'assets/icons/firebase.png',
        proficiency: 0.85,
      ),
      SkillModel(
        name: 'Cubit',
        iconPath: 'assets/icons/bloc.png',
        proficiency: 0.90,
      ),
      SkillModel(
        name: 'REST APIs',
        iconPath: 'assets/icons/api.png',
        proficiency: 0.90,
      ),
      SkillModel(
        name: 'Clean Arch',
        iconPath: 'assets/icons/clean_arch.png',
        proficiency: 0.85,
      ),
      SkillModel(
        name: 'Git/GitHub',
        iconPath: 'assets/icons/git.png',
        proficiency: 0.90,
      ),
      SkillModel(
        name: 'OOP',
        iconPath: 'assets/icons/git.png',
        proficiency: 0.90,
      ),
      SkillModel(
        name: 'Testing,',
        iconPath: 'assets/icons/git.png',
        proficiency: 0.95,
      ),
      SkillModel(
        name: 'MVVM',
        iconPath: 'assets/icons/git.png',
        proficiency: 0.95,
      ),
      SkillModel(
        name: 'Payment',
        iconPath: 'assets/icons/git.png',
        proficiency: 0.95,
      ),
      SkillModel(
        name: 'SOLID',
        iconPath: 'assets/icons/git.png',
        proficiency: 0.95,
      ),
    ];
  }

  @override
  Future<List<Certificate>> getCertificates() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const [
      CertificateModel(
        name: 'Flutter Advanced Course Blocand MVVM Pattern',
        issuer: 'Udemy',
        date: 'Aug 2025',
        credentialUrl:
            'https://www.udemy.com/certificate/UC-e29a2a39-6a4e-4526-8fd6-a6e2f335e890/',
      ),
      CertificateModel(
        name: 'Complete Flutter & DartDevelopment from Udemy',
        issuer: 'Udemy',
        date: 'July 2025',
        credentialUrl:
            'https://www.udemy.com/certificate/UC-4cbf2516-5506-4ce4-b3ea-31e93399497b/',
      ),
      CertificateModel(
        name: 'Mastering Flutter: Responsive& Adaptive UI Design',
        issuer: 'Udemy',
        date: 'Sep 2025',
        credentialUrl:
            'https://www.udemy.com/course/mastering-flutter-responsive-adaptive-ui-design-arabic',
      ),
      CertificateModel(
        name: 'Flutter Payment Integration:Stripe, PayPal & More!',
        issuer: 'Udemy',
        date: 'Oct 2025',
        credentialUrl: '',
      ),
    ];
  }
}
