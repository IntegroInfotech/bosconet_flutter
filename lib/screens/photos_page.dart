import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/cards/photos_card.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/models/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosPage extends StatelessWidget {
  String imageId;

  PhotosPage({Key? key, required this.imageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextTitle(title: "BOSCONET PHOTOS"),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<BosconetPhotos>>(
        future: apiServices.fetchPhotos(imageId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final photosAlbum = snapshot.data ?? [];
              return AlignedGridView.count(
                itemCount: photosAlbum.length,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (BuildContext context, int index) {
                  return PhotosCard(image: photosAlbum[index].image);
                },
              );
            }
          } else {
            print(snapshot.connectionState);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
