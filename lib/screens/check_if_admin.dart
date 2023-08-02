import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resimob/helper/helper_functions.dart';
import 'package:resimob/screens/sign_in.dart';
import 'package:resimob/services/auth_service.dart';
import 'package:resimob/services/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckIfAdmin extends StatefulWidget {
  const CheckIfAdmin({super.key});
  static String checkIfAdminName = '/adminornot';

  @override
  State<CheckIfAdmin> createState() => _CheckIfAdminState();
}

class _CheckIfAdminState extends State<CheckIfAdmin> {
  bool isAdmin = false;
  AuthService sv = AuthService();
  @override
  void initState() {
    getAdminOrNot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
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
        isAdmin
            ? const Center(
                child: Text('You are Admin'),
              )
            : const Center(
                child: Text('You are not Admin'),
              )
      ],
    ));
  }

  Future getAdminOrNot() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      isAdmin = sf.getBool(HelperFunctions.isUserOrAdminKey)!;
    });
  }
}
