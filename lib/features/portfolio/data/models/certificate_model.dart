import '../../domain/entities/certificate.dart';

class CertificateModel extends Certificate {
  const CertificateModel({
    required super.name,
    required super.issuer,
    required super.date,
    super.credentialUrl,
    super.imageUrl,
  });
}
