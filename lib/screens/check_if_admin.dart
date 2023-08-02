import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resimob/helper/helper_functions.dart';
import 'package:resimob/models/user.dart';
import 'package:resimob/screens/admin/home.dart';
import 'package:resimob/screens/sign_in.dart';
import 'package:resimob/screens/user/user_home.dart';
import 'package:resimob/services/auth_service.dart';
import 'package:resimob/services/database_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CheckIfAdmin extends StatefulWidget {
  const CheckIfAdmin({super.key});
  static String checkIfAdminName = '/adminOrNot';

  @override
  State<CheckIfAdmin> createState() => _CheckIfAdminState();
}

class _CheckIfAdminState extends State<CheckIfAdmin> {
  bool isAdmin = false;

  AuthService sv = AuthService();
  Map<String, dynamic> userData = {};
  getUserData() async {
    Map<String, dynamic> data =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getUserData();
    setState(() {
      userData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
    getAdminOrNot();
  }

  @override
  Widget build(BuildContext context) {
    print(userData);
    return isAdmin ? Home() : UserHome();
  }

  Future getAdminOrNot() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      isAdmin = sf.getBool(HelperFunctions.isUserOrAdminKey)!;
    });
  }
}
