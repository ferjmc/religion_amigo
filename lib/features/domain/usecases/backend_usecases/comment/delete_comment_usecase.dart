import 'package:religion_amigo/features/domain/entities/comment_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class DeleteCommentUseCase {
  final BackendRepository repository;

  DeleteCommentUseCase({required this.repository});

  Future<void> call(CommentEntity comment) {
    return repository.deleteComment(comment);
  }
}
