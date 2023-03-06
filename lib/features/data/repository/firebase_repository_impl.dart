import 'dart:io';

import 'package:religion_amigo/features/data/data_sources/firebase_data_source/firebase_data_source.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/repository/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> getCurrentUid() async => remoteDataSource.getCurrentUid();

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signInUser(UserEntity user) async =>
      remoteDataSource.signInUser(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<UserEntity> signUpUser(UserEntity user) async =>
      remoteDataSource.signUpUser(user);

  @override
  Future<String> uploadImageToStorage(
          File? file, bool isPost, String childName) async =>
      remoteDataSource.uploadImageToStorage(file, isPost, childName);
}
