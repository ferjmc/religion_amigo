import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class UpdateUserUseCase {
  final BackendRepository repository;

  UpdateUserUseCase({required this.repository});

  Future<void> call(UserEntity userEntity) {
    return repository.updateUser(userEntity);
  }
}
