import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:religion_amigo/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:religion_amigo/features/presentation/page/main_screen/main_screen.dart';

import '../../../../consts.dart';
import '../../../../profile_widget.dart';
import '../../widgets/button_container_widget.dart';
import '../../widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  bool _isSigningUp = false;
  bool _isUploading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  File? _image;

  Future selectImage() async {
    try {
      final pickedFile =
          await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print("no ha seleccionado imagen");
        }
      });
    } catch (e) {
      toast("ha ocurrido un error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            toast("Email o Password no valido");
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(uid: authState.uid);
                } else {
                  return _bodyWidget();
                }
              },
            );
          }
          return _bodyWidget();
        },
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/ic_instagram.svg",
                  color: primaryColor,
                ),
              ),
              sizeVer(15),
              Center(
                child: Stack(
                  children: [
                    Container(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: profileWidget(image: _image))),
                    Positioned(
                      right: -10,
                      bottom: -15,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: blueColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizeVer(30),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Username",
              ),
              sizeVer(15),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
              ),
              sizeVer(15),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              sizeVer(15),
              FormContainerWidget(
                controller: _bioController,
                hintText: "Bio",
              ),
              sizeVer(15),
              ButtonContainerWidget(
                color: blueColor,
                text: "Registrarse",
                onTapListener: () {
                  _signUpUser();
                },
              ),
              sizeVer(10),
              _isSigningUp == true || _isUploading == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Por favor espere",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        sizeHor(10),
                        const CircularProgressIndicator()
                      ],
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
              SizedBox(height: 50),
              const Divider(
                color: secondaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Ya tienes una cuenta? ",
                    style: TextStyle(color: primaryColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, PageConst.signInPage, (route) => false);
                    },
                    child: const Text(
                      "Ingresa.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signUpUser() async {
    setState(() {
      _isSigningUp = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signUpUser(
            user: UserEntity(
                email: _emailController.text,
                password: _passwordController.text,
                bio: _bioController.text,
                username: _usernameController.text,
                totalPosts: 0,
                totalFollowing: 0,
                followers: const [],
                totalFollowers: 0,
                website: "",
                following: const [],
                name: "",
                imageFile: _image))
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      _usernameController.clear();
      _bioController.clear();
      _emailController.clear();
      _passwordController.clear();
      _isSigningUp = false;
    });
  }
}
