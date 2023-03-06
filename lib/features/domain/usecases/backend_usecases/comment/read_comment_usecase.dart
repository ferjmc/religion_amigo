import 'package:religion_amigo/features/domain/entities/comment_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class ReadCommentsUseCase {
  final BackendRepository repository;

  ReadCommentsUseCase({required this.repository});

  Stream<List<CommentEntity>> call(String postId) {
    return repository.readComments(postId);
  }
}
