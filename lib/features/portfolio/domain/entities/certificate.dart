import 'package:equatable/equatable.dart';

class Certificate extends Equatable {
  final String name;
  final String issuer;
  final String date;
  final String? credentialUrl;
  final String? imageUrl;

  const Certificate({
    required this.name,
    required this.issuer,
    required this.date,
    this.credentialUrl,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, issuer, date, credentialUrl, imageUrl];
}
