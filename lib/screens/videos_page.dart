import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/cards/videos_card.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/models/videos.dart';
import 'package:bosconet/widgets/open_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextTitle(title: "BOSCONET VIDEOS"),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<BosconetVideo>>(
        future: apiServices.fetchVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final videos = snapshot.data ?? [];
              return AlignedGridView.count(
                itemCount: videos.length,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      openUrl(context,
                          url:
                              'https://www.youtube.com/watch?v=${videos[index].vId}',
                          color: Constants.primaryColor);
                    },
                    child: VideosCard(
                      title: videos[index].title,
                      vId: videos[index].vId,
                    ),
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
