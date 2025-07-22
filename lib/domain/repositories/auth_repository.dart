import 'package:init_flutter/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String username, String password);
}
