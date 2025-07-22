import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init_flutter/domain/entities/user_entity.dart';
import 'package:init_flutter/shared/providers/auth_provider.dart';

void main() {
  test('AuthNotifier: login exitoso debe retornar un usuario', () async {
    final container = ProviderContainer();
    final notifier = container.read(authProvider.notifier);

    await notifier.login('emilys', 'emilyspass');
    final user = container.read(authProvider).asData?.value;

    expect(user, isA<UserEntity>());
    expect(user?.username, 'emilys');
  });

  test('AuthNotifier: login fallido debe retornar error', () async {
    final container = ProviderContainer();
    final notifier = container.read(authProvider.notifier);

    await notifier.login('usuario_invalido', 'clave_invalida');
    final result = container.read(authProvider);

    expect(result.hasError, true);
  });
}
