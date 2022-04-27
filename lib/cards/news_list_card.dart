import 'package:bosconet/screens/news_detail_page.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/screens/news_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsListCard extends StatelessWidget {
  String title, desciption, image;

  NewsListCard(
      {Key? key,
      required this.title,
      required this.desciption,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Constants.primaryColorWhite,
              child: FadeInImage.assetNetwork(
                image: image,
                placeholder: 'assets/images/loading.gif',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                maxLines: 2,
                style: const TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 25,
                  fontFamily: "EB Garamond",
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              color: const Color(0xffe0e0e0),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(8),
              child: Text(
                desciption,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "EB Garamond",
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
