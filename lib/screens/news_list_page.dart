import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/cards/news_list_card.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/models/news.dart';
import 'package:bosconet/screens/news_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewsListPage extends StatelessWidget {
  ApiServices apiServices = ApiServices();

  String news_id;
  List<BosconetNews> news;

  NewsListPage({required this.news, required this.news_id});

  @override
  Widget build(BuildContext context) {
    print('news_id is $news_id');
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(title: 'BOSCONET NEWS LIST', fontSize: 25),
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
      ),
      body: AlignedGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {

          print('news_id is $news_id');
          return GestureDetector(
            child: NewsListCard(
              image: news[index].sImg,
              title: news[index].title,
              desciption: news[index].description,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NewsDetailPage(news: news[index], id: news_id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
