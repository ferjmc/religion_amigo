import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/user/get_single_user_usecase.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;
  GetSingleUserCubit({required this.getSingleUserUseCase})
      : super(GetSingleUserInitial());

  Future<void> getSingleUser({required String uid}) async {
    emit(GetSingleUserLoading());
    try {
      final user = await getSingleUserUseCase.call(uid);

      emit(GetSingleUserLoaded(user: user));
    } on SocketException catch (_) {
      emit(GetSingleUserFailure());
    } catch (_) {
      emit(GetSingleUserFailure());
    }
  }
}
