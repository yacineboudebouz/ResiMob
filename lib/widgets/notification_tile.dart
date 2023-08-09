import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resimob/constants/colors.dart';
import 'package:intl/intl.dart';

class NotificationTile extends StatelessWidget {
  NotificationTile({super.key, required this.map, this.onTap});
  Map<String, dynamic> map;

  Function()? onTap;
  IconData getIcon(String action) {
    if (action == 'TimeChange') {
      return Icons.more_time;
    }
    if (action == 'Announcement') {
      return Icons.feedback;
    }
    return Icons.report_problem_outlined;
  }

  String trimStringAt50(String inputString) {
    if (inputString.length <= 30) {
      return inputString;
    } else {
      String trimmedString = inputString.substring(0, 30);
      return '$trimmedString  ...see more';
    }
  }

  String getTimeFormat(String dtime) {
    final time = DateTime.parse(dtime);
    return DateFormat('MMMM dd, yyyy').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: mainColor,
                  ),
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  width: MediaQuery.sizeOf(context).height * 0.1,
                  child: Icon(
                    getIcon(map['type']),
                    color: Colors.white,
                    size: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      map['title'],
                      style: const TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      map['type'],
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      trimStringAt50(
                        map['details'],
                      ),
                    ),
                    Text(
                      getTimeFormat(map['timestamp']),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
