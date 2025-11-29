import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/repositories/portfolio_repository.dart';

// States
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

  const PortfolioLoaded({required this.projects, required this.skills});

  @override
  List<Object> get props => [projects, skills];
}

class PortfolioError extends PortfolioState {
  final String message;
  const PortfolioError(this.message);
  @override
  List<Object> get props => [message];
}

// Cubit
class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepository repository;

  PortfolioCubit({required this.repository}) : super(PortfolioInitial());

  Future<void> loadPortfolioData() async {
    emit(PortfolioLoading());
    try {
      final projects = await repository.getProjects();
      final skills = await repository.getSkills();
      emit(PortfolioLoaded(projects: projects, skills: skills));
    } catch (e) {
      emit(PortfolioError(e.toString()));
    }
  }
}
