import 'package:flutter/material.dart';
import 'package:religion_amigo/injection_container.dart' as di;
import 'package:religion_amigo/consts.dart';
import 'package:religion_amigo/features/domain/entities/user_entity.dart';
import 'package:religion_amigo/features/domain/usecases/backend_usecases/user/get_single_user_usecase.dart';
import 'package:religion_amigo/profile_widget.dart';

class FollowingPage extends StatelessWidget {
  final UserEntity user;
  const FollowingPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: Text("Following"),
        backgroundColor: backGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: user.following!.isEmpty
                  ? _noFollowersWidget()
                  : ListView.builder(
                      itemCount: user.following!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageConst.singleUserProfilePage,
                                arguments: user.uid);
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                width: 40,
                                height: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child:
                                      profileWidget(imageUrl: user.profileUrl),
                                ),
                              ),
                              sizeHor(10),
                              Text(
                                "${user.username}",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }

  _noFollowersWidget() {
    return Center(
      child: Text(
        "No Following",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
