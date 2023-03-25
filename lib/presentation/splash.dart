import 'package:authusingfire/infrastructure/auth.dart';
import 'package:authusingfire/presentation/home.dart';
import 'package:authusingfire/presentation/login.dart';
import 'package:flutter/widgets.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthFire().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ScreenHome();
          } else {
            return ScreenLogin();
          }
        });
  }
}
