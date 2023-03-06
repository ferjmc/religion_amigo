import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

import '../../../entities/user_entity.dart';

class CreateUserUseCase {
  final BackendRepository repository;

  CreateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.createUser(user);
  }
}
