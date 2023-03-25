import 'package:authusingfire/application/auth_provider.dart';
import 'package:authusingfire/infrastructure/auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .signOut(context);
              },
              child: const Text("SignOut"))),
    );
  }
}
