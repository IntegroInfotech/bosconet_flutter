import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SuccessStoriesDetailsPage extends StatelessWidget {
  String id, image, title, description;

  SuccessStoriesDetailsPage(
      {Key? key,
      required this.id,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TextTitle(title: "SUCCESS STORY DETAILS"),
          centerTitle: true,
          backgroundColor: Constants.primaryColor),
      body: Card(
        child: ListView(
          children: [
            Container(
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
                description,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share('http://bosco-net.in/sstory_share.php?id=$id',
              subject: 'news');
        },
        backgroundColor: Constants.primaryColor,
        child: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }
}
