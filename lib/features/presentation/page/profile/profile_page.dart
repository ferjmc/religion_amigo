import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/presentation/cubit/post/post_cubit.dart';
import 'package:religion_amigo/features/presentation/page/profile/widgets/profile_main_widget.dart';
import 'package:religion_amigo/injection_container.dart' as di;

class ProfilePage extends StatelessWidget {
  final UserEntity currentUser;
  const ProfilePage({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<PostCubit>(),
      child: ProfileMainWidget(
        currentUser: currentUser,
      ),
    );
  }
}
