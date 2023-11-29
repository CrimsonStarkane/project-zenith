import 'package:flutter/material.dart';
import 'package:project_zenith/subpages/fresh_page.dart';
import 'package:project_zenith/subpages/profile_page.dart';
import 'package:project_zenith/widgets/draw_option.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F4),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 25),
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(2, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 29),
                    child: Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF313638),
                            shape: OvalBorder(),
                          ),
                        ),
                        const Spacer(),
                        const Expanded(
                          flex: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "NAZIB DIMAL",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              Text(
                                '20230000000@my.xu.edu.ph',
                                style: TextStyle(
                                  color: Color(0xFF636769),
                                  fontSize: 15,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DrawOption(
                          imgPath: "assets/white_logo.png",
                          text: "Home",
                        ),
                        DrawOption(
                          imgPath: "assets/build_icon.png",
                          text: "Profile",
                        ),
                        DrawOption(
                          imgPath: "assets/later_icon.png",
                          text: "Attendance",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'WORKSPACE',
                            style: TextStyle(
                              color: Color(0xFF959A9C),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        DrawOption(
                            imgPath: "assets/join_icon.png",
                            text: "Booth Department"),
                        DrawOption(
                          imgPath: "assets/extra_icon.png",
                          text: "Create new workspace",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'SHARED',
                            style: TextStyle(
                              color: Color(0xFF959A9C),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        DrawOption(
                          imgPath: "assets/build_icon.png",
                          text: "Booth Department",
                        ),
                        DrawOption(
                          imgPath: "assets/later_icon.png",
                          text: "Finance Department",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 8),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 3,
            child: ProfilePage(),
          ),
        ],
      ),
    );
  }
}