import 'package:religion_amigo/features/domain/entities/comment_entity.dart';
import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';

abstract class BackendDataSource {
  // User
  Stream<List<UserEntity>> getUsers(UserEntity user);
  Future<UserEntity> getSingleUser(String uid);
  Future<void> createUser(UserEntity user);
  Future<void> updateUser(UserEntity user);
  Future<void> followUnFollowUser(UserEntity user);

  // Post Features
  Future<void> createPost(PostEntity post);
  Stream<List<PostEntity>> readPosts(PostEntity post);
  Stream<List<PostEntity>> readSinglePost(String postId);
  Future<void> updatePost(PostEntity post);
  Future<void> deletePost(PostEntity post);
  Future<void> likePost(PostEntity post);

  // Comment Features
  Future<void> createComment(CommentEntity comment);
  Stream<List<CommentEntity>> readComments(String postId);
  Future<void> updateComment(CommentEntity comment);
  Future<void> deleteComment(CommentEntity comment);
  Future<void> likeComment(CommentEntity comment);

  // Replay Features
  Future<void> createReplay(ReplayEntity replay);
  Stream<List<ReplayEntity>> readReplays(ReplayEntity replay);
  Future<void> updateReplay(ReplayEntity replay);
  Future<void> deleteReplay(ReplayEntity replay);
  Future<void> likeReplay(ReplayEntity replay);
  Stream<List<UserEntity>> getSingleOtherUser(String otherUid);
}
