import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/cards/success_storis_card.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/models/success_stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SuccessStoriesPage extends StatefulWidget {
  const SuccessStoriesPage({Key? key}) : super(key: key);

  @override
  State<SuccessStoriesPage> createState() => _SuccessStoriesPageState();
}

class _SuccessStoriesPageState extends State<SuccessStoriesPage> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(title: "SUCCESS STORIES"),
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
      ),
      body: FutureBuilder<List<BosconetSuccessStories>>(
        future: apiServices.fetchSuccessStories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final successStories = snapshot.data ?? [];
              return AlignedGridView.count(
                itemCount: successStories.length,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (BuildContext context, int index) {
                  return SuccessStoriesCard(
                      id: successStories[index].id,
                      title: successStories[index].title,
                      desciption: successStories[index].description,
                      image: successStories[index].image);
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
