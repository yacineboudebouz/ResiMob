import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resimob/constants/colors.dart';
import 'package:resimob/screens/admin/timings.dart';

import '../../services/auth_service.dart';
import '../../widgets/options_tile.dart';
import '../sign_in.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService sv = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounColor,
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: MediaQuery.sizeOf(context).height * 0.1),
        child: Column(
          children: [
            const Text(
              'Hello, Admin !',
              style: TextStyle(
                  color: mainColor, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Welcome Back ! ',
              style: TextStyle(color: textColor, fontSize: 20),
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
                  color: mainColor, fontSize: 25, fontWeight: FontWeight.bold),
            ),

            // GridView(
            //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 300,
            //     childAspectRatio: 1.5,
            //     crossAxisSpacing: 20,
            //     mainAxisSpacing: 20,
            //   ),
            //   children: [
            //     Container(
            //       height: 20,
            //       width: 20,
            //       color: Colors.amber,
            //     ),
            //     Container(
            //       height: 20,
            //       width: 20,
            //       color: Colors.amber,
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
