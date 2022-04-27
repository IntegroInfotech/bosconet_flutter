import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:bosconet/constants/constants.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String? date;
  final String description;
  final String? handle;

  const NotificationCard({
    Key? key,
    required this.title,
    this.date,
    required this.description,
    this.handle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Constants.primaryColorWhite,
      ),
      margin: EdgeInsets.only(left: 8, right: 8, top: 5),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: TextTitle(
              title: date ?? '',
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextTitle(
            title: title,
            fontWeight: FontWeight.bold,
            color: Constants.primaryColor,
          ),
          const Divider(
            color: Constants.primaryColor,
            indent: 1,
          ),
          TextTitle(
            title: description,
            fontSize: 20,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
