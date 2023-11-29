import 'package:flutter/material.dart';
import 'package:project_zenith/widgets/aesthetic_border.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      heightFactor: 0.9,
      widthFactor: 0.6,
      child: Padding(
        padding: EdgeInsets.only(bottom: 50),
        child: AestheticBorder(
          borderColor: Colors.black,
          mainColor: Color(0xFFF8F7F4),
          child: ProfileView(),
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(38),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.center,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: const ShapeDecoration(
                              color: Color(0xFF313638),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 12,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color(0xFF06BCC1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: const Text(
                          "20230000000",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD4515D),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: const Text(
                      'NAZIB DIMAL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFE66D),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: const Text(
                      '20230000000@my.xu.edu.ph',
                      style: TextStyle(
                        color: Color(0xFF646869),
                        fontSize: 15,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Attendance Reflected",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF313638),
                    fontSize: 15,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Time Started:",
                              style: TextStyle(
                                color: Color(0xFF313638),
                                fontSize: 15,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 13),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: const Text(
                                '00:00 AM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Today's Duty Hours:",
                              style: TextStyle(
                                color: Color(0xFF313638),
                                fontSize: 15,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 13),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: const Text(
                                '00:00:00',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}