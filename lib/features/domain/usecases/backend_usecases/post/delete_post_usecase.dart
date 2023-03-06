import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class DeletePostUseCase {
  final BackendRepository repository;

  DeletePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.deletePost(post);
  }
}
