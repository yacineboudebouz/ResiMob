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
  @override
  void initState() {
    super.initState();
    getAdminOrNot();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid),
        child: isAdmin ? Home() : UserHome());
  }

  Future getAdminOrNot() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      isAdmin = sf.getBool(HelperFunctions.isUserOrAdminKey)!;
    });
  }
}
