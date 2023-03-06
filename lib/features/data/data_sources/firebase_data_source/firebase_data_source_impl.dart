import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:religion_amigo/consts.dart';
import 'package:religion_amigo/features/data/data_sources/firebase_data_source/firebase_data_source.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:uuid/uuid.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;

  FirebaseRemoteDataSourceImpl(
      {required this.firebaseStorage, required this.firebaseAuth});

  @override
  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<void> signInUser(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty || user.password!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: user.email!, password: user.password!);
      } else {
        print("los campos no pueden estar vacios");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        toast("el usuario no existe");
      } else if (e.code == "wrong-password") {
        toast("email o password no valido");
      }
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserEntity> signUpUser(UserEntity user) async {
    try {
      // create the user in firebase
      final created = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      // store the profile image on firecloud
      String img = "";
      if (user.imageFile != null) {
        img =
            await uploadImageToStorage(user.imageFile, false, "profileImages");
      }
      // send the response
      final response = user.copyWith(
        uid: created.user?.uid.toString(),
        profileUrl: img,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        toast("email is already taken");
      } else {
        toast("something went wrong");
      }
      return user;
    }
  }

  @override
  Future<String> uploadImageToStorage(
      File? file, bool isPost, String childName) async {
    Reference ref = firebaseStorage
        .ref()
        .child(childName)
        .child(firebaseAuth.currentUser!.uid);

    if (isPost) {
      String id = Uuid().v1();
      ref = ref.child(id);
    }

    final uploadTask = ref.putFile(file!);

    final imageUrl =
        (await uploadTask.whenComplete(() {})).ref.getDownloadURL();

    return await imageUrl;
  }
}
