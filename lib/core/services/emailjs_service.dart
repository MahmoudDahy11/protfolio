import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:protfolio/core/utils/secret.dart';

class EmailJSService {
  static const String _serviceId = serviceId;
  static const String _templateId = templateId;
  static const String _publicKey = publicKey;

  static const String _endpoint = 'https://api.emailjs.com/api/v1.0/email/send';

  Future<bool> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _publicKey,
          'template_params': {
            'from_name': name,
            'from_email': email,
            'message': message,
            'to_name': 'Portfolio Owner',
          },
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(
          'Failed to send email: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Error sending email: $e');
    }
  }

  bool isConfigured() {
    return _serviceId.isNotEmpty &&
        _templateId.isNotEmpty &&
        _publicKey.isNotEmpty;
  }
}
