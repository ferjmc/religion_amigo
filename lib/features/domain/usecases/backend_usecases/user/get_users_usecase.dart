import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class GetUsersUseCase {
  final BackendRepository repository;

  GetUsersUseCase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity userEntity) {
    return repository.getUsers(userEntity);
  }
}
