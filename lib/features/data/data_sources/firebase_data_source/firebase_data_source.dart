import 'dart:io';

import 'package:religion_amigo/features/domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource {
  // Credential
  Future<void> signInUser(UserEntity user);
  Future<UserEntity> signUpUser(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUid();

  // Cloud Storage
  Future<String> uploadImageToStorage(
      File? file, bool isPost, String childName);
}
