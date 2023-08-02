import 'package:flutter/material.dart';
import 'package:resimob/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resimob/screens/check_if_admin.dart';
import 'package:resimob/services/database_service.dart';
import '../constants/widgets.dart';
import '../helper/helper_functions.dart';
import '../services/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoading = false;

  AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isShowen = true;
  bool _isEmailValidate = false;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.sizeOf(context).height * 0.55,
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.45,
              color: mainColor.withOpacity(0.2),
            ),
          ),
        ]),
        Positioned.fill(
          top: MediaQuery.sizeOf(context).height * 0.4,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.6,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.sizeOf(context).width * 0.15,
                  20,
                  MediaQuery.sizeOf(context).width * 0.15,
                  0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'ResiMob',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).width * 0.1,
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                          _isEmailValidate = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                        });
                      },
                      validator: (value) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!)
                            ? null
                            : "Please enter a valid email";
                      },
                      decoration: InputDecoration(
                        suffixIcon: _isEmailValidate
                            ? const Icon(
                                Icons.check,
                                color: mainColor,
                              )
                            : const Icon(
                                Icons.close,
                                color: mainColor,
                              ),
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                          color: mainColor,
                        ),
                        label: const Text('Mail Adress'),
                      ),
                    ),
                    TextFormField(
                      obscureText: isShowen,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Password must be at least 6 characters';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          label: Text('Password'),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: mainColor,
                          ),
                          suffix: IconButton(
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: mainColor,
                            ),
                            onPressed: () {
                              setState(() {
                                isShowen = !isShowen;
                              });
                            },
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await authService
          .loginWithEmailAndPassword(email, password)
          .then((value) async {
        if (value == true) {
          // saving values in SF
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData();
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveEmailSF(email);
          await HelperFunctions.saveUserNameSF(
              snapshot.docs[0]['firstName'] + snapshot.docs[0]['lastName']);
          await HelperFunctions.saveUserOrAdmin(snapshot.docs[0]['isAdmin']);
          Navigator.of(context)
              .pushReplacementNamed(CheckIfAdmin.checkIfAdminName);
          // setting shared state
        } else {
          showSnackBar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
