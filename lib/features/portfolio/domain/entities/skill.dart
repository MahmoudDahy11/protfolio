import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String name;
  final String iconPath; 
  final double proficiency; 

  const Skill({
    required this.name,
    required this.iconPath,
    required this.proficiency,
  });

  @override
  List<Object?> get props => [name, iconPath, proficiency];
}
