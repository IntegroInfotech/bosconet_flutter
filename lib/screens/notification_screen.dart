import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/cards/notification_card.dart';
import 'package:bosconet/models/notifications.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColorGray,
      body: FutureBuilder<List<BosconetNotification>>(
        future: apiServices.fetchNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print('jsonData ${snapshot.data}');
              final notifications = snapshot.data ?? [];
              return ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                      date: "${notifications[index].date}",
                      title: notifications[index].title,
                      description: notifications[index].description);
                },
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
