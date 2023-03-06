import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

import '../../../entities/user_entity.dart';

class FollowUnFollowUseCase {
  final BackendRepository repository;

  FollowUnFollowUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.followUnFollowUser(user);
  }
}
