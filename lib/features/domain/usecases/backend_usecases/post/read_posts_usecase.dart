import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class ReadPostsUseCase {
  final BackendRepository repository;

  ReadPostsUseCase({required this.repository});

  Stream<List<PostEntity>> call(PostEntity post) {
    return repository.readPosts(post);
  }
}
