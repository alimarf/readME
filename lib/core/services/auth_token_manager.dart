import 'package:hive/hive.dart';

class AuthTokenManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _expiresAt = 'expires_at';

  final Box _box;

  AuthTokenManager() : _box = Hive.box('auth');

  String? getAccessToken() {
    return _box.get(_accessTokenKey);
  }

  String? getRefreshToken() {
    return _box.get(_refreshTokenKey);
  }

  DateTime? getExpiresAt() {
    return _box.get(_expiresAt) != null
        ? DateTime.parse(_box.get(_expiresAt))
        : null;
  }

  void clear() {
    _box.delete(_accessTokenKey);
    _box.delete(_refreshTokenKey);
    _box.delete(_expiresAt);
  }

  void put(
      {required String accessToken,
      String? refreshToken,
      String? expiresAt}) {
    _box.put(_accessTokenKey, accessToken);
    _box.put(_refreshTokenKey, refreshToken);
    _box.put(_expiresAt, expiresAt);
  }
}
