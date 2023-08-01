import 'package:flutter/material.dart';
import 'package:resimob/constants/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                      onPressed: () {},
                      child: Text('Login'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
