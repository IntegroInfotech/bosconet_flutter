import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class VideosCard extends StatelessWidget {
  final String vId;
  final String title;

  const VideosCard({
    Key? key,
    required this.vId,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        color: Colors.white,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              'https://img.youtube.com/vi/${vId}/0.jpg',
              fit: BoxFit.fill,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  color: const Color(0x4A090909),

                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    color: const Color(0xbf090909),
                    height: 50,
                    child: TextTitle(
                      title: title,
                      color: Constants.primaryColorWhite,
                    ),
                  ),
                ),
                const Icon(
                  Icons.video_collection,
                  size: 65,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
