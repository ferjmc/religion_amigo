import 'package:religion_amigo/features/domain/entities/post_entity.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';

class AppEntity {
  final UserEntity? currentUser;
  final PostEntity? postEntity;

  final String? uid;
  final String? postId;

  AppEntity({this.currentUser, this.postEntity, this.uid, this.postId});
}
