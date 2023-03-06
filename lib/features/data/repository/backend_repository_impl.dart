import 'package:religion_amigo/features/data/data_sources/backend_data_source/backend_data_source.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/entities/comment_entity.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';

class BackendRepositoryImpl implements BackendRepository {
  final BackendDataSource remoteDataSource;

  BackendRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createComment(CommentEntity comment) async =>
      remoteDataSource.createComment(comment);

  @override
  Future<void> createPost(PostEntity post) async =>
      remoteDataSource.createPost(post);

  @override
  Future<void> createReplay(ReplayEntity replay) async =>
      remoteDataSource.createReplay(replay);

  @override
  Future<void> createUser(UserEntity user) async =>
      remoteDataSource.createUser(user);

  @override
  Future<void> deleteComment(CommentEntity comment) async =>
      remoteDataSource.deleteComment(comment);

  @override
  Future<void> deletePost(PostEntity post) async =>
      remoteDataSource.deletePost(post);

  @override
  Future<void> deleteReplay(ReplayEntity replay) async =>
      remoteDataSource.deleteReplay(replay);

  @override
  Future<void> followUnFollowUser(UserEntity user) async =>
      remoteDataSource.followUnFollowUser(user);

  @override
  Stream<List<UserEntity>> getSingleOtherUser(String otherUid) =>
      remoteDataSource.getSingleOtherUser(otherUid);

  @override
  Future<UserEntity> getSingleUser(String uid) =>
      remoteDataSource.getSingleUser(uid);

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) =>
      remoteDataSource.getUsers(user);

  @override
  Future<void> likeComment(CommentEntity comment) async =>
      remoteDataSource.likeComment(comment);

  @override
  Future<void> likePost(PostEntity post) async =>
      remoteDataSource.likePost(post);

  @override
  Future<void> likeReplay(ReplayEntity replay) async =>
      remoteDataSource.likeReplay(replay);

  @override
  Stream<List<CommentEntity>> readComments(String postId) =>
      remoteDataSource.readComments(postId);

  @override
  Stream<List<PostEntity>> readPosts(PostEntity post) =>
      remoteDataSource.readPosts(post);

  @override
  Stream<List<ReplayEntity>> readReplays(ReplayEntity replay) =>
      remoteDataSource.readReplays(replay);

  @override
  Stream<List<PostEntity>> readSinglePost(String postId) =>
      remoteDataSource.readSinglePost(postId);

  @override
  Future<void> updateComment(CommentEntity comment) async =>
      remoteDataSource.updateComment(comment);

  @override
  Future<void> updatePost(PostEntity post) async =>
      remoteDataSource.updatePost(post);

  @override
  Future<void> updateReplay(ReplayEntity replay) async =>
      remoteDataSource.updateReplay(replay);

  @override
  Future<void> updateUser(UserEntity user) async =>
      remoteDataSource.updateUser(user);
}
