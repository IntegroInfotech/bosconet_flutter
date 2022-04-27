import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/screens/success_stories_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessStoriesCard extends StatelessWidget {
  String id, title, desciption, image;

  SuccessStoriesCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.desciption,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessStoriesDetailsPage(
              id: id,
              title: title,
              image: image,
              description: desciption,
            ),
          ),
        ),
      ),
    );
  }
}
