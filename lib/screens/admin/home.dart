import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../services/auth_service.dart';
import '../sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService sv = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () async {
            await sv.signOut().then((value) {
              print(value);
              if (value == true) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignIn()));
              }
            });
          },
          child: const Text('LogOut')),
    );
  }
}
