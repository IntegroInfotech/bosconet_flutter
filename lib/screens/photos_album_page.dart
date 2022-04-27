import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/cards/photos_album_card.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/models/photos_album.dart';
import 'package:bosconet/screens/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosAlbumsPage extends StatefulWidget {
  const PhotosAlbumsPage({Key? key}) : super(key: key);

  @override
  State<PhotosAlbumsPage> createState() => _PhotosAlbumsPageState();
}

class _PhotosAlbumsPageState extends State<PhotosAlbumsPage> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextTitle(title: "BOSCONET ALBUM"),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<BosconetPhotoAlbum>>(
        future: apiServices.fetchPhotoAlbums(),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PhotosPage(imageId: photosAlbum[index].id),
                        ),
                      );
                    },
                    child: PhotosAlbumCard(
                        title: photosAlbum[index].title,
                        image: photosAlbum[index].image),
                  );
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
