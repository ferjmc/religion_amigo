import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class CreatePostUseCase {
  final BackendRepository repository;

  CreatePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.createPost(post);
  }
}
