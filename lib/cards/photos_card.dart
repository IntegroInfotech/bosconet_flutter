import 'package:flutter/material.dart';

class PhotosCard extends StatelessWidget {
  String image;

  PhotosCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        child: FadeInImage.assetNetwork(
          placeholder: "assets/images/loading.gif",
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
