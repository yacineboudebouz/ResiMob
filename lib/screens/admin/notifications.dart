import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resimob/constants/colors.dart';
import 'package:resimob/services/database_service.dart';
import 'package:resimob/widgets/notification_tile.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});
  static const notificationsNamed = '/notifications';
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future getAllNotifications() async {
    final provider = Provider.of<DatabaseService>(context, listen: false);
    await provider.getAllNotifications();
  }

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
    if (inputString.length <= 40) {
      return inputString;
    } else {
      String trimmedString = inputString.substring(0, 40);
      return '$trimmedString  ...see more';
    }
  }

  @override
  void initState() {
    super.initState();
    getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: Consumer<DatabaseService>(
        builder: (_, db, __) {
          var notifications = db.notifications;

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NotificationTile(
                  map: notifications[index],
                );
              },
              itemCount: notifications.length,
            ),
          );
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: FloatingActionButton(
            backgroundColor: mainColor,
            shape: CircleBorder(),
            onPressed: () {
              // FAB action
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
