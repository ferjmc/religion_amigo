import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class ReadReplaysUseCase {
  final BackendRepository repository;

  ReadReplaysUseCase({required this.repository});

  Stream<List<ReplayEntity>> call(ReplayEntity replay) {
    return repository.readReplays(replay);
  }
}
