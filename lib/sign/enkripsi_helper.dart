import 'dart:convert';
import 'package:crypto/crypto.dart';

class CryptoHelper {
  static String encrypt(String input) {
    final key = utf8.encode('your_secret_key');
    final bytes = utf8.encode(input);
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }
}
