import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class UpdatePostUseCase {
  final BackendRepository repository;

  UpdatePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.updatePost(post);
  }
}
