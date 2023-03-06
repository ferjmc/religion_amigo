import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class LikePostUseCase {
  final BackendRepository repository;

  LikePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.likePost(post);
  }
}
