import 'package:flutter/material.dart';
import 'package:project_zenith/custom_widgets.dart';
import 'package:project_zenith/db_api.dart';
import 'package:firedart/firedart.dart';
import 'package:project_zenith/globals.dart';
import 'package:project_zenith/pages/attendance_page.dart';

class FreshPage extends StatelessWidget {
  FreshPage({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 30),
      child: FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.6,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: AestheticBorder(
            borderColor: Colors.black,
            mainColor: const Color(0xFFF8F7F4),
            child: Content(
              emailController: emailController,
              passController: passController,
            ),
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passController;

  const Content(
      {super.key, required this.emailController, required this.passController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Image.asset("assets/later_icon.png"),
            ),
            const Spacer(),
            const Text(
              'Welcome to Zenith!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF313638),
                fontSize: 40,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const Text(
              'Crusader Yearbook',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: SubmitButton(
                            text: "Check In",
                            gradient: const [
                              Color(0xFF06BCC1),
                              Color(0xFF168285)
                            ],
                            minSize: const Size(200, 50),
                            func: () async {
                              emailController.clear();
                              passController.clear();
                              await showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (context) {
                                  return CheckInDialog(
                                    emailController: emailController,
                                    passController: passController,
                                  );
                                },
                              );
                            },
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
    );
  }
}

class CheckInDialog extends StatefulWidget {
  const CheckInDialog({
    super.key,
    required this.emailController,
    required this.passController,
  });

  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  State<CheckInDialog> createState() => _CheckInDialogState();
}

class _CheckInDialogState extends State<CheckInDialog> {
  bool obscured = true;

  void _toggle() {
    setState(() {
      obscured = !obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AlertDialog(
        content: SizedBox(
          width: 350,
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 35, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 250,
                      child: Text(
                        "Enter Account to Render Duty Hours",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 12, right: 12),
                child: TextFormField(
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  controller: widget.emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    hintText: "Enter your email address",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 144, 142, 142),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 12, right: 12),
                child: TextFormField(
                  obscureText: obscured,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  controller: widget.passController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 144, 142, 142),
                        fontWeight: FontWeight.normal),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            obscured ? Icons.visibility_off : Icons.visibility,
                            color: Theme.of(context).dialogBackgroundColor,
                          ),
                          onPressed: () {
                            _toggle();
                          }),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25, right: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SubmitButton(
                    text: "Enter",
                    gradient: const [Color(0xFF06BCC1), Color(0xFF168285)],
                    minSize: const Size(200, 50),
                    func: () async {
                      List<Document> docs = await Firestore.instance
                          .collection('users')
                          .where('email', isEqualTo: widget.emailController.text)
                          .where('password', isEqualTo: widget.passController.text)
                          .get();

                      if (docs.isEmpty && context.mounted) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red.shade800,
                          content: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.error_outline,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Oh snap! Invalid credentials.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          action: SnackBarAction(
                            label: 'Hide',
                            textColor: Colors.white,
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        ));
                        return;
                      }

                      Document thisUser = docs.first;
                      await thisUser.reference.update({
                        'time_started': DateTime.now().toUtc(),
                        'has_checked_in': true,
                      });

                      User u = User(
                        authId: await thisUser['auth_id'],
                        email: await thisUser['email'],
                        id: await thisUser['id'],
                        password: await thisUser['password'],
                        username: await thisUser['username'],
                        timeStarted: DateTime.now().toUtc(),
                        hasCheckedIn: await thisUser['has_checked_in'],
                        totalMinutes: await thisUser['total_minutes'],
                      );

                      checkedInUsers[u] = Duration.zero;

                      Attendance? newAttendance = await gUser?.checkin(u, DateTime.now().toUtc());
                      gAttendances.add(newAttendance!);

                      userAttendance[u] = newAttendance;

                      if (context.mounted) {
                        showDialog(
                          context: context, 
                          builder: (context) {
                            return const AlertDialog(
                              content: SizedBox(
                                width: 350,
                                height: 350,
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                      size: 50
                                    ),
                                    Text(
                                      "Successfully Checked In!",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: "Rubik"
                                      ),
                                    ),
                                    Spacer()
                                  ]
                                )
                              ),
                            );
                          },
                        );
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          Navigator.pop(context);
                        });
                        widget.emailController.clear();
                        widget.passController.clear();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
