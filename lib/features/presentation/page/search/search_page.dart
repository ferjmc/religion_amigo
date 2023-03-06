import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:religion_amigo/features/presentation/cubit/post/post_cubit.dart';
import 'package:religion_amigo/features/presentation/page/search/widget/search_main_widget.dart';
import 'package:religion_amigo/injection_container.dart' as di;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (context) => di.sl<PostCubit>(),
        ),
      ],
      child: SearchMainWidget(),
    );
  }
}
