import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  readSecureData(String key) async{
    String? value = await storage.read(key: key) ?? null;
    return value;
  }

  deleteSecureData(String key) async {
    storage.delete(key: key);
  }
}