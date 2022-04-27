import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PhotosAlbumCard extends StatefulWidget {
  String title, image;

  PhotosAlbumCard({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  State<PhotosAlbumCard> createState() => _PhotosAlbumCardState();
}

class _PhotosAlbumCardState extends State<PhotosAlbumCard> {


  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 250,
        child: ListView(
          children: [
            SizedBox(
              height: 170,
              child: FadeInImage.assetNetwork(
                image: widget.image,
                placeholder: "assets/images/loading.gif",
                fit: BoxFit.cover,
              ),
            ),
            const Divider(
              height: 1,
              color: Constants.primaryColor,
            ),
            Center(
              child: TextTitle(
                title: widget.title,
                color: Constants.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
