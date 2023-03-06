import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:religion_amigo/features/domain/entities/replay_entity.dart';
import 'package:religion_amigo/features/presentation/cubit/replay/replay_cubit.dart';
import 'package:religion_amigo/features/presentation/page/post/comment/widget/edit_replay_main_widget.dart';
import 'package:religion_amigo/injection_container.dart' as di;

class EditReplayPage extends StatelessWidget {
  final ReplayEntity replay;

  const EditReplayPage({Key? key, required this.replay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReplayCubit>(
      create: (context) => di.sl<ReplayCubit>(),
      child: EditReplayMainWidget(replay: replay),
    );
  }
}
