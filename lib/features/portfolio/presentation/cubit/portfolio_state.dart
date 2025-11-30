import 'package:equatable/equatable.dart';
import '../../domain/entities/certificate.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();
  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<Project> projects;
  final List<Skill> skills;
  final List<Certificate> certificates;

  const PortfolioLoaded({
    required this.projects,
    required this.skills,
    required this.certificates,
  });

  @override
  List<Object> get props => [projects, skills, certificates];
}

class PortfolioError extends PortfolioState {
  final String message;
  const PortfolioError(this.message);
  @override
  List<Object> get props => [message];
}
