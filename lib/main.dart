import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:religion_amigo/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/user/get_single_other_user/get_single_other_user_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/user/user_cubit.dart';
import 'package:religion_amigo/features/presentation/page/main_screen/main_screen.dart';

import 'features/presentation/page/credential/sign_in_page.dart';
import 'on_generate_route.dart';
import 'injection_container.dart' as di;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider(create: (_) => di.sl<UserCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleUserCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleOtherUserCubit>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Amigo',
          darkTheme: ThemeData.dark(),
          onGenerateRoute: OnGenerateRoute.route,
          initialRoute: "/",
          routes: {
            "/": (context) {
              return BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(
                    uid: authState.uid,
                  );
                } else {
                  return const SignInPage();
                }
              });
            }
          }),
    );
  }
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page not found"),
      ),
      body: const Center(child: Text("Page not found")),
    );
  }
}
