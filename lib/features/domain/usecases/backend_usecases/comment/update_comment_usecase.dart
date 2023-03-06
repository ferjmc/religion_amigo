import 'package:religion_amigo/features/domain/entities/comment_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class UpdateCommentUseCase {
  final BackendRepository repository;

  UpdateCommentUseCase({required this.repository});

  Future<void> call(CommentEntity comment) {
    return repository.updateComment(comment);
  }
}
