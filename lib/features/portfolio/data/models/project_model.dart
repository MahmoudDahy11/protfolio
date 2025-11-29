import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.name,
    required super.description,
    required super.technologies,
    super.imageUrl,
    required super.projectUrl,
  });
}
