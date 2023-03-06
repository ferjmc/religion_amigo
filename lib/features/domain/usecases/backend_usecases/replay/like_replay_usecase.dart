import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class LikeReplayUseCase {
  final BackendRepository repository;

  LikeReplayUseCase({required this.repository});

  Future<void> call(ReplayEntity replay) {
    return repository.likeReplay(replay);
  }
}
