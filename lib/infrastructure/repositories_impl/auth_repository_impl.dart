import 'package:init_flutter/domain/entities/user_entity.dart';
import 'package:init_flutter/domain/repositories/auth_repository.dart';
import '../datasources/auth_api_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<UserEntity> login(String username, String password) async {
    final data = await apiService.login(username, password);

    return UserEntity(
      id: data['id'],
      username: data['username'],
      email: data['email'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );
  }
}
