import 'package:authusingfire/application/auth_provider.dart';
import 'package:authusingfire/presentation/screen_signUp.dart';
import 'package:authusingfire/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/color_utils.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        hexStringToColor("CB2B93"),
        hexStringToColor("9546C4"),
        hexStringToColor("5E61F4")
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reusableTextField("Enter Username", false, emailTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Password", true, passwordTextController),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<AuthProvider>(context, listen: false)
                          .signInWithemail(emailTextController.text,
                              passwordTextController.text ,context);
                    },
                    child: const Text("LogIn")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenSignUp()));
                    },
                    child: const Text("SignUp")),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
