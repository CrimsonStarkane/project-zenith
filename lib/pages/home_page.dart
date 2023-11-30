import 'package:flutter/material.dart';
import 'package:project_zenith/db_api.dart';
import 'package:project_zenith/main.dart';
import 'package:project_zenith/pages/auth_page.dart';
import 'package:project_zenith/subpages/profile_page.dart';
import 'package:project_zenith/subpages/task_page.dart';
import 'package:project_zenith/widgets/draw_option.dart';
import 'package:project_zenith/widgets/sidebar_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String emailAddress;
  final String username;
  const HomePage({
    super.key,
    required this.emailAddress,
    required this.username,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F4),
      body: Row(
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 330, maxWidth: 385),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          Expanded(
                            flex: 18,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.username,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  widget.emailAddress,
                                  style: const TextStyle(
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
                    const SizedBox(height: 20),
                    SidebarList(children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DrawOption(
                              imgPath: "assets/white_logo.png",
                              text: "Logout",
                              func: () async {
                                await Authenticator.logout();

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.clear();

                                ownedWorkspaces.clear();
                                sharedWorkspaces.clear();
                                lists.clear();
                                tasks.clear();
                                currentUser = null;

                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AuthPage(),
                                    ),
                                  );
                                }
                              },
                            ),
                            DrawOption(
                              imgPath: "assets/build_icon.png",
                              text: "Profile",
                              func: () {
                                if (context.mounted) {}
                              },
                            ),
                            DrawOption(
                              imgPath: "assets/later_icon.png",
                              text: "Attendance",
                              func: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(children: [
                          const Text(
                            'WORKSPACE',
                            style: TextStyle(
                              color: Color(0xFF959A9C),
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          )
                        ]),
                      ),
                      Container(
                        constraints: const BoxConstraints(maxHeight: 150),
                        child: ownedWorkspaces.isEmpty
                            ? const Column(
                                mainAxisSize: MainAxisSize.min,
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: ownedWorkspaces.length,
                                itemBuilder: (context, index) {
                                  Workspace workspace =
                                      ownedWorkspaces.elementAt(index);

                                  return DrawOption(
                                    imgPath: "assets/build_icon.png",
                                    text: workspace.title.toString(),
                                    func: () {
                                      if (context.mounted) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaskPage(
                                                  label: workspace.title);
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
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
                      Container(
                        constraints: const BoxConstraints(maxHeight: 150),
                        child: sharedWorkspaces.isEmpty
                            ? const Column(
                                mainAxisSize: MainAxisSize.min,
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: sharedWorkspaces.length,
                                itemBuilder: (context, index) {
                                  Workspace workspace =
                                      sharedWorkspaces.elementAt(index);

                                  return DrawOption(
                                    imgPath: "assets/later_icon.png",
                                    text: workspace.title.toString(),
                                    func: () {
                                      if (context.mounted) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaskPage(
                                                  label: workspace.title);
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ProfilePage(
              username: widget.username,
              emailAddress: widget.emailAddress,
            ),
          ),
        ],
      ),
    );
  }
}
