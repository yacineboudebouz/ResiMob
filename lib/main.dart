import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resimob/constants/colors.dart';
import 'package:resimob/constants/routes.dart';
import 'package:resimob/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resimob/screens/admin/feedback.dart';

import 'package:resimob/screens/admin/notifications.dart';
import 'package:resimob/screens/admin/objects.dart';
import 'package:resimob/screens/admin/problems.dart';
import 'package:resimob/screens/admin/timings.dart';
import 'package:resimob/screens/admin/users.dart';
import 'package:resimob/screens/check_if_admin.dart';
import 'package:resimob/services/database_service.dart';

import 'helper/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => DatabaseService(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white, backgroundColor: mainColor),
          primaryColor: mainColor,
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          useMaterial3: true,
        ),
        home: Wrapper(),
        routes: {
          CheckIfAdmin.checkIfAdminName: (context) => const CheckIfAdmin(),
          Timings.timingsNamed: (context) => const Timings(),
          Notifications.notificationsNamed: (context) => const Notifications(),
          Users.usersNamed: (context) => const Users(),
          Objects.objectsNamed: (context) => const Objects(),
          Feedbaack.feedbackNamed: (context) => const Feedbaack(),
          Problems.problemsNamed: (context) => const Problems(),
        });
  }
}
