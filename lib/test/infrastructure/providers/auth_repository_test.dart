import 'package:flutter_test/flutter_test.dart';
import 'package:init_flutter/infrastructure/repositories_impl/auth_repository_impl.dart';
import 'package:init_flutter/infrastructure/datasources/auth_api_service.dart';

void main() {
  // Creamos el AuthApiService sin parámetros, como está en tu código actual
  final apiService = AuthApiService();
  final repository = AuthRepositoryImpl(apiService);

  test('AuthRepositoryImpl: login correcto devuelve usuario', () async {
    final user = await repository.login('emilys', 'emilyspass');
    expect(user.username, 'emilys');
  });

  test('AuthRepositoryImpl: login incorrecto lanza excepción', () async {
    expect(
      () async => await repository.login('usuario_invalido', 'clave_invalida'),
      throwsA(isA<Exception>()),
    );
  });
}
