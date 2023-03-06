import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/repository/firebase_repository.dart';

class SignInUserUseCase {
  final FirebaseRepository repository;

  SignInUserUseCase({required this.repository});

  Future<void> call(UserEntity userEntity) {
    return repository.signInUser(userEntity);
  }
}
