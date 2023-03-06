import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:religion_amigo/features/data/data_sources/backend_data_source/backend_data_source.dart';
import 'package:religion_amigo/features/data/data_sources/backend_data_source/backend_data_source_impl.dart';
import 'package:religion_amigo/features/data/data_sources/firebase_data_source/firebase_data_source.dart';
import 'package:religion_amigo/features/data/data_sources/firebase_data_source/firebase_data_source_impl.dart';
import 'package:religion_amigo/features/data/repository/backend_repository_impl.dart';
import 'package:religion_amigo/features/data/repository/firebase_repository_impl.dart';
import 'package:religion_amigo/features/domain/repository/backend_repository.dart';
import 'package:religion_amigo/features/domain/repository/firebase_repository.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/comment/create_comment_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/comment/delete_comment_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/comment/like_comment_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/comment/read_comment_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/comment/update_comment_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/post/create_post_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/post/delete_post_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/post/like_post_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/post/read_posts_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/post/read_single_post_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/post/update_post_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/replay/create_replay_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/replay/delete_replay_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/replay/like_replay_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/replay/read_replays_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/replay/update_replay_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/user/create_user_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/user/follow_unfollow_user_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/user/get_single_other_user_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/user/get_single_user_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/user/get_users_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/user/update_user_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/firebase_usecases/credential/get_current_uid_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/firebase_usecases/credential/is_sign_in_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/firebase_usecases/credential/sign_in_user_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/firebase_usecases/credential/sign_out_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/firebase_usecases/credential/sign_up_user_usecase.dart';
import 'package:religion_amigo/features/domain/usecases/firebase_usecases/storage/upload_image_to_storage_usecase.dart';
import 'package:religion_amigo/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/comment/comment_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/post/get_single_post/get_single_post_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/post/post_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/replay/replay_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/user/get_single_other_user/get_single_other_user_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/user/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(() => AuthCubit(
      signOutUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      getCurrentUidUseCase: sl.call()));

  sl.registerFactory(
    () => CredentialCubit(
      signUpUseCase: sl.call(),
      signInUserUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => UserCubit(
        updateUserUseCase: sl.call(),
        getUsersUseCase: sl.call(),
        followUnFollowUseCase: sl.call()),
  );

  sl.registerFactory(
    () => GetSingleUserCubit(getSingleUserUseCase: sl.call()),
  );

  sl.registerFactory(
    () => GetSingleOtherUserCubit(getSingleOtherUserUseCase: sl.call()),
  );

  // Post Cubit Injection
  sl.registerFactory(
    () => PostCubit(
        createPostUseCase: sl.call(),
        deletePostUseCase: sl.call(),
        likePostUseCase: sl.call(),
        readPostUseCase: sl.call(),
        updatePostUseCase: sl.call()),
  );

  sl.registerFactory(
    () => GetSinglePostCubit(readSinglePostUseCase: sl.call()),
  );

  // Comment Cubit Injection
  sl.registerFactory(
    () => CommentCubit(
      createCommentUseCase: sl.call(),
      deleteCommentUseCase: sl.call(),
      likeCommentUseCase: sl.call(),
      readCommentsUseCase: sl.call(),
      updateCommentUseCase: sl.call(),
    ),
  );

  // Replay Cubit Injection
  sl.registerFactory(
    () => ReplayCubit(
        createReplayUseCase: sl.call(),
        deleteReplayUseCase: sl.call(),
        likeReplayUseCase: sl.call(),
        readReplaysUseCase: sl.call(),
        updateReplayUseCase: sl.call()),
  );

// Use Cases
// User
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton(
      () => SignUpUseCase(repository: sl.call(), backend: sl.call()));
  sl.registerLazySingleton(() => SignInUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetUsersUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => FollowUnFollowUseCase(repository: sl.call()));
  sl.registerLazySingleton(
      () => GetSingleOtherUserUseCase(repository: sl.call()));

  // Cloud Storage
  sl.registerLazySingleton(
      () => UploadImageToStorageUseCase(repository: sl.call()));

  // Post
  sl.registerLazySingleton(() => CreatePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ReadPostsUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => LikePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdatePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => DeletePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ReadSinglePostUseCase(repository: sl.call()));

  // Comment
  sl.registerLazySingleton(() => CreateCommentUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ReadCommentsUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => LikeCommentUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateCommentUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => DeleteCommentUseCase(repository: sl.call()));

  // Replay
  sl.registerLazySingleton(() => CreateReplayUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ReadReplaysUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => LikeReplayUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateReplayUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => DeleteReplayUseCase(repository: sl.call()));

  // Repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<BackendRepository>(
      () => BackendRepositoryImpl(remoteDataSource: sl.call()));

  // Remote Data Source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(
          firebaseAuth: sl.call(), firebaseStorage: sl.call()));
  sl.registerLazySingleton<BackendDataSource>(
      () => BackendDataSourceImpl(auth: sl.call()));

  // Externals
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseStorage);
}
