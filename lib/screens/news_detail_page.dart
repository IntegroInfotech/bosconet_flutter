import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/models/news.dart';
import 'package:bosconet/widgets/news_images_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class NewsDetailPage extends StatelessWidget {
  String id;
  BosconetNews news;

  NewsDetailPage({required this.id, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(title: 'BOSCONET NEWS DETAILS', fontSize: 25),
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          child: ListView(
            children: [
              Container(
                height: 200,
                child: NewsImagesSlider(newsId: news.id, image: news.sImg),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(8),
                child: Text(
                  news.date,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 25,
                    fontFamily: "EB Garamond",
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(8),
                child: Text(
                  news.title,
                  style: const TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 25,
                    fontFamily: "EB Garamond",
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Container(
                color: const Color(0xffe0e0e0),
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(8),
                child: Text(
                  news.description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "EB Garamond",
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share('http://bosco-net.in/newshare.php?id=${news.id}',
              subject: 'news');
        },
        backgroundColor: Constants.primaryColor,
        child: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }
}
