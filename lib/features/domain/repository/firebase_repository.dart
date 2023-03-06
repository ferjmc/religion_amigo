import 'dart:io';

import '../entities/user_entity.dart';

abstract class FirebaseRepository {
  // Credential Features
  Future<void> signInUser(UserEntity user);
  Future<UserEntity> signUpUser(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUid();

  // Cloud Storage Feature
  Future<String> uploadImageToStorage(
      File? file, bool isPost, String childName);
}
