import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';
import 'package:religion_amigo/features/domain/repository/firebase_repository.dart';

class GetSingleOtherUserUseCase {
  final BackendRepository repository;

  GetSingleOtherUserUseCase({required this.repository});

  Stream<List<UserEntity>> call(String otherUid) {
    return repository.getSingleOtherUser(otherUid);
  }
}
