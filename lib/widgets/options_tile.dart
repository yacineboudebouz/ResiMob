import 'package:flutter/material.dart';

import '../constants/colors.dart';

class OptionsTile extends StatelessWidget {
  OptionsTile({
    required this.route,
    required this.icon,
    required this.text,
    super.key,
  });
  IconData icon;
  String text;
  String route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.17,
        width: MediaQuery.sizeOf(context).height * 0.17,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: mainColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: MediaQuery.sizeOf(context).height * 0.03,
              child: Icon(
                icon,
                color: mainColor,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              text,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Color(0xff596273), fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
