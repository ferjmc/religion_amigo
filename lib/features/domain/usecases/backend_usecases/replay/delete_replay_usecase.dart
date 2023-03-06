import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class DeleteReplayUseCase {
  final BackendRepository repository;

  DeleteReplayUseCase({required this.repository});

  Future<void> call(ReplayEntity replay) {
    return repository.deleteReplay(replay);
  }
}
