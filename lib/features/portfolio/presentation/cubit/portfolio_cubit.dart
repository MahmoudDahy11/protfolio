import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/portfolio_repository.dart';
import 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepository repository;

  PortfolioCubit({required this.repository}) : super(PortfolioInitial());

  Future<void> loadPortfolioData() async {
    emit(PortfolioLoading());
    try {
      final projects = await repository.getProjects();
      final skills = await repository.getSkills();
      final certificates = await repository.getCertificates();
      emit(
        PortfolioLoaded(
          projects: projects,
          skills: skills,
          certificates: certificates,
        ),
      );
    } catch (e) {
      emit(PortfolioError(e.toString()));
    }
  }
}
