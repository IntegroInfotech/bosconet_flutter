import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/models/news_images.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

ApiServices apiServices = ApiServices();

class NewsImagesSlider extends StatefulWidget {
  String newsId, image;

  NewsImagesSlider({Key? key, required this.newsId, required this.image})
      : super(key: key);

  @override
  State<NewsImagesSlider> createState() => _NewsImagesSliderState();
}

class _NewsImagesSliderState extends State<NewsImagesSlider> {
  @override
  Widget build(BuildContext context) {
    print("newsIndex is ${widget.newsId}");

    return FutureBuilder<List<NewsImage>>(
      future: apiServices.fetchNewsImages(widget.newsId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final newsImages = snapshot.data ?? [];
            return CarouselSlider.builder(
              itemCount: newsImages.isEmpty ? 1 : newsImages.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return FadeInImage.assetNetwork(
                  height: 200,
                  image: index == 0 ? widget.image : newsImages[index].image,
                  placeholder: 'assets/images/loading.gif',
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                height: double.infinity,
                initialPage: 0,
                enableInfiniteScroll: false,
                aspectRatio: 16 / 9,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1,
              ),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
