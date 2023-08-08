import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resimob/constants/colors.dart';
import 'package:resimob/services/database_service.dart';

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
          print(notifications);
          print('hhhhhhhhhhhhhhhhhhhh');
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(notifications[index]['test']);
              },
              itemCount: notifications.length,
            ),
          );
        },
      ),
    );
  }
}
