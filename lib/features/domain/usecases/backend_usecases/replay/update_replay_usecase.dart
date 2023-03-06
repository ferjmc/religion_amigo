import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class UpdateReplayUseCase {
  final BackendRepository repository;

  UpdateReplayUseCase({required this.repository});

  Future<void> call(ReplayEntity replay) {
    return repository.updateReplay(replay);
  }
}
