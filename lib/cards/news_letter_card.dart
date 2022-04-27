import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/widgets/open_url.dart';
import 'package:flutter/material.dart';

class NewsLetterCard extends StatelessWidget {
  String title, date, imageUrl, pdfLink;

  NewsLetterCard(
      {required this.title,
      required this.date,
      required this.imageUrl,
      required this.pdfLink});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  image: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      child: Text(
                        date,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontFamily: "EB Garamond",
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
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
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (states) => Constants.primaryColor),
                      ),
                      onPressed: () {
                        openUrl(context,
                            url: pdfLink, color: Constants.primaryColor);
                      },
                      child: const Text(
                        'View / Download',
                        maxLines: 2,
                        style: TextStyle(
                          color: Constants.primaryColorWhite,
                          fontSize: 20,
                          fontFamily: "EB Garamond",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
