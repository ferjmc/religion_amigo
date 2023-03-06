import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:religion_amigo/consts.dart';
import 'package:religion_amigo/features/data/data_sources/backend_data_source/backend_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:religion_amigo/features/data/models/user_model.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/entities/comment_entity.dart';

class BackendDataSourceImpl implements BackendDataSource {
  final FirebaseAuth auth;

  BackendDataSourceImpl({required this.auth}) : _httpClient = http.Client();

  final http.Client _httpClient;

  static const _baseUrlBackend = '10.0.2.2:8081';

  Future<Map<String, String>> getAuthHeaders() async {
    final token = await auth.currentUser?.getIdToken();
    if (token == null) {
      toast("error getting user token");
    }
    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer ${token!}',
    };
    return headers;
  }

  // User
  @override
  Future<void> createUser(UserEntity user) async {
    // convert to json map
    final model = UserModel(
      uid: user.uid,
      username: user.username,
      name: user.name,
      email: user.email,
      bio: user.bio,
    ).toJson();

    // set the headers
    final headers = await getAuthHeaders();

    // set the request
    final userRequest = Uri.http(
      _baseUrlBackend,
      '/api/v1/users/register',
    );

    try {
      final response = await _httpClient.post(
        userRequest,
        headers: headers,
        body: jsonEncode(model),
      );
      if (response.statusCode != 201) {
        toast("error creating user");
      }
    } catch (error) {
      print(error);
      toast("algo ha salido mal");
    }
  }

  @override
  Future<UserEntity> getSingleUser(String uid) async {
    try {
      // set the headers
      final headers = await getAuthHeaders();

      //request
      final userRequest = Uri.http(_baseUrlBackend, '/api/v1/users');


      final response = await _httpClient.get(userRequest, headers: headers);
      if (response.statusCode != 200) {
        toast("error obteniendo datos del usuario");
      }
      final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;
      return UserModel.fromJson(bodyJson);
    } catch (error) {
      print(error);
      toast("algo salio mal");
      throw Exception();
    }
  }

  @override
  Future<void> updateUser(UserEntity user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> createComment(CommentEntity comment) {
    // TODO: implement createComment
    throw UnimplementedError();
  }

  @override
  Future<void> createPost(PostEntity post) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<void> createReplay(ReplayEntity replay) {
    // TODO: implement createReplay
    throw UnimplementedError();
  }

  @override
  Future<void> deleteComment(CommentEntity comment) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(PostEntity post) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<void> deleteReplay(ReplayEntity replay) {
    // TODO: implement deleteReplay
    throw UnimplementedError();
  }

  @override
  Future<void> followUnFollowUser(UserEntity user) {
    // TODO: implement followUnFollowUser
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getSingleOtherUser(String otherUid) {
    // TODO: implement getSingleOtherUser
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<void> likeComment(CommentEntity comment) {
    // TODO: implement likeComment
    throw UnimplementedError();
  }

  @override
  Future<void> likePost(PostEntity post) {
    // TODO: implement likePost
    throw UnimplementedError();
  }

  @override
  Future<void> likeReplay(ReplayEntity replay) {
    // TODO: implement likeReplay
    throw UnimplementedError();
  }

  @override
  Stream<List<CommentEntity>> readComments(String postId) {
    // TODO: implement readComments
    throw UnimplementedError();
  }

  @override
  Stream<List<PostEntity>> readPosts(PostEntity post) {
    // TODO: implement readPosts
    throw UnimplementedError();
  }

  @override
  Stream<List<ReplayEntity>> readReplays(ReplayEntity replay) {
    // TODO: implement readReplays
    throw UnimplementedError();
  }

  @override
  Stream<List<PostEntity>> readSinglePost(String postId) {
    // TODO: implement readSinglePost
    throw UnimplementedError();
  }

  @override
  Future<void> updateComment(CommentEntity comment) {
    // TODO: implement updateComment
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(PostEntity post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

  @override
  Future<void> updateReplay(ReplayEntity replay) {
    // TODO: implement updateReplay
    throw UnimplementedError();
  }
}
