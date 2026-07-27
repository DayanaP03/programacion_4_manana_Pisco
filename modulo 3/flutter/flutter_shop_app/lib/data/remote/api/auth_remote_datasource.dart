// lib/data/remote/api/auth_remote_datasource.dart

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/error/api_exception.dart';
import 'dio_client.dart';
import '../../local/secure_storage.dart';
import '../../../domain/model/auth_models.dart';

abstract class AuthRemoteDatasource {
  Future<LoggedUser> login(String username, String password);
  Future<LoggedUser> register(String username, String email, String password, String password2);
  Future<void>       logout();
  Future<void>       requestPasswordReset(String email);
  Future<void>       confirmPasswordReset({
    required String uid,
    required String token,
    required String newPassword,
    required String newPassword2,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio           _dio;
  final SecureStorage _storage;

  AuthRemoteDatasourceImpl(this._dio, this._storage);

  @override
  Future<LoggedUser> login(String username, String password) async {
    try {
      final res = await _dio.post(
        '/auth/login/',
        data: {
          'username': username,
          'password': password,
        },
      );

      final data = res.data as Map<String, dynamic>;
      final access = data['access'] as String;
      final refresh = data['refresh'] as String;

      final user = LoggedUser.fromMap(data);
      await _storage.saveTokens(access, refresh);
      await _storage.saveUser(
        id: user.id,
        username: user.username,
        email: user.email,
        isStaff: user.isStaff,
      );

      return user;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<LoggedUser> register(
    String username,
    String email,
    String password,
    String password2,
  ) async {
    try {
      final res = await _dio.post(
        '/auth/register/',
        data: {
          'username': username,
          'email': email,
          'password': password,
          'password2': password2,
        },
      );

      final data = res.data as Map<String, dynamic>;
      final access = data['access'] as String;
      final refresh = data['refresh'] as String;

      final user = LoggedUser.fromMap(data);
      await _storage.saveTokens(access, refresh);
      await _storage.saveUser(
        id: user.id,
        username: user.username,
        email: user.email,
        isStaff: user.isStaff,
      );

      return user;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout/');
    } on DioException catch (_) {
      // Si el backend rechaza logout por token vencido, limpiamos sesión local igual.
    } finally {
      await _storage.clearSession();
    }
  }

  @override
  Future<void> requestPasswordReset(String email) async {
    try {
      await _dio.post(
        '/auth/password-reset/',
        data: {'email': email},
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<void> confirmPasswordReset({
    required String uid,
    required String token,
    required String newPassword,
    required String newPassword2,
  }) async {
    try {
      await _dio.post(
        '/auth/password-reset/confirm/',
        data: {
          'uid':           uid,
          'token':         token,
          'new_password':  newPassword,
          'new_password2': newPassword2,
        },
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

final authDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasourceImpl(
    ref.watch(dioProvider),
    ref.watch(secureStorageProvider),
  );
});