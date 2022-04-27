import 'package:flutter/cupertino.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  String title, desciption, image;

  NewsCard(
      {Key? key,
      required this.title,
      required this.desciption,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: double.infinity,
            color: Constants.primaryColorWhite,
            child: FadeInImage.assetNetwork(
              image: image,
              placeholder: 'assets/images/loading.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
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
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: const Color(0xffe0e0e0),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      desciption,
                      maxLines: 8,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "EB Garamond",
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
