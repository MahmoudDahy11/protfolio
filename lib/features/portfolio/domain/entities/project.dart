import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String name;
  final String description;
  final List<String> technologies;
  final String? imageUrl;
  final String projectUrl;

  const Project({
    required this.name,
    required this.description,
    required this.technologies,
    this.imageUrl,
    required this.projectUrl,
  });

  @override
  List<Object?> get props => [
    name,
    description,
    technologies,
    imageUrl,
    projectUrl,
  ];
}
