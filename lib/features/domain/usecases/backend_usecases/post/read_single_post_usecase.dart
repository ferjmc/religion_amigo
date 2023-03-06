import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class ReadSinglePostUseCase {
  final BackendRepository repository;

  ReadSinglePostUseCase({required this.repository});

  Stream<List<PostEntity>> call(String postId) {
    return repository.readSinglePost(postId);
  }
}
