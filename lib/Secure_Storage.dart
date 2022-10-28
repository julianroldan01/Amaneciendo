import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  static const storage = FlutterSecureStorage();

  static const String _keyToken = 'token';

  static Future setToken(String token) async {
    await storage.write(key: _keyToken, value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: _keyToken);
  }
}
