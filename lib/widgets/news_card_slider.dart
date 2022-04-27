import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/cards/news_card.dart';
import 'package:bosconet/models/news.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/screens/news_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsCardSlider extends StatefulWidget {
  const NewsCardSlider({Key? key}) : super(key: key);

  @override
  State<NewsCardSlider> createState() => _NewsCardSliderState();
}

ApiServices apiServices = ApiServices();

class _NewsCardSliderState extends State<NewsCardSlider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BosconetNews>>(
      future: apiServices.fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print("news snapshot.data ${snapshot.data}");
            final news = snapshot.data ?? [];
            print("news is $news");
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Constants.primaryColorWhite,
                    child: CarouselSlider.builder(
                      itemCount: news.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        print("news[index].id is : ${news[index].id}");
                        return GestureDetector(
                          child: NewsCard(
                            title: news[index].title,
                            desciption: news[index].description,
                            image: news[index].sImg,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsListPage(
                                    news: news, news_id: news[index].id),
                              ),
                            );
                          },
                        );
                      },
                      options: CarouselOptions(
                        height: double.infinity,
                        initialPage: 0,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 1,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
