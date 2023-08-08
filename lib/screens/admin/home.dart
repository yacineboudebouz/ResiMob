import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resimob/constants/colors.dart';
import 'package:resimob/screens/admin/feedback.dart';
import 'package:resimob/screens/admin/notifications.dart';
import 'package:resimob/screens/admin/problems.dart';
import 'package:resimob/screens/admin/timings.dart';
import 'package:resimob/screens/admin/users.dart';
import '../../services/auth_service.dart';
import '../../services/database_service.dart';
import '../../widgets/options_tile.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService sv = AuthService();
  Map<String, dynamic>? userData;
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseService>(builder: (context, value, child) {
      var userData = value.userData;

      return Scaffold(
        backgroundColor: backgrounColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: mainColor,
          title: const Text(
            'ResiMob',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: MediaQuery.sizeOf(context).height * 0.1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Hello, Admin !',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Welcome Back ! ',
                  style: const TextStyle(color: textColor, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                const Divider(
                  color: Colors.black,
                  height: 3,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                const Text(
                  'What do you want to do ?',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    OptionsTile(
                        route: Timings.timingsNamed,
                        icon: Icons.ac_unit_outlined,
                        text: 'Time'),
                    const SizedBox(
                      width: 5,
                    ),
                    OptionsTile(
                        route: Notifications.notificationsNamed,
                        icon: Icons.notifications_none_outlined,
                        text: 'Notifications'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    OptionsTile(
                        route: Notifications.notificationsNamed,
                        icon: Icons.breakfast_dining_outlined,
                        text: 'Objects'),
                    const SizedBox(
                      width: 5,
                    ),
                    OptionsTile(
                        route: Users.usersNamed,
                        icon: Icons.person_add,
                        text: 'Users')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    OptionsTile(
                        route: Feedbaack.feedbackNamed,
                        icon: Icons.feedback,
                        text: 'Feedback'),
                    const SizedBox(
                      width: 5,
                    ),
                    OptionsTile(
                        route: Problems.problemsNamed,
                        icon: Icons.report_problem_outlined,
                        text: 'Problems')
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
