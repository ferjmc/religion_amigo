import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class CreateReplayUseCase {
  final BackendRepository repository;

  CreateReplayUseCase({required this.repository});

  Future<void> call(ReplayEntity replay) {
    return repository.createReplay(replay);
  }
}
