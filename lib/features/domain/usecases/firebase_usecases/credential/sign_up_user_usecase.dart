import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';
import 'package:religion_amigo/features/domain/repository/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository repository;
  final BackendRepository backend;

  SignUpUseCase({required this.repository, required this.backend});

  Future<void> call(UserEntity userEntity) {
    return repository
        .signUpUser(userEntity)
        .then((user) => backend.createUser(user));
  }
}
