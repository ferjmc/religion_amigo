import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class GetSingleUserUseCase {
  final BackendRepository repository;

  GetSingleUserUseCase({required this.repository});

  Future<UserEntity> call(String uid) {
    return repository.getSingleUser(uid);
  }
}
