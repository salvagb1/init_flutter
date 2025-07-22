import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init_flutter/domain/entities/user_entity.dart';
import 'package:init_flutter/domain/usecases/login_usecase.dart';
import 'package:init_flutter/infrastructure/datasources/auth_api_service.dart';
import 'package:init_flutter/infrastructure/repositories_impl/auth_repository_impl.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<UserEntity?>>(
  (ref) => AuthNotifier(
    LoginUseCase(
      AuthRepositoryImpl(AuthApiService()),
    ),
  ),
);

class AuthNotifier extends StateNotifier<AsyncValue<UserEntity?>> {
  final LoginUseCase loginUseCase;

  AuthNotifier(this.loginUseCase) : super(const AsyncValue.data(null));

  Future<void> login(String username, String password) async {
    state = const AsyncLoading();
    try {
      final user = await loginUseCase.execute(username, password);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  void logout() {
  state = const AsyncValue.data(null);
}
}
