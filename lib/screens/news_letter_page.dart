import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/cards/news_letter_card.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/models/newsletter.dart';
import 'package:flutter/material.dart';

class NewsLetterPage extends StatefulWidget {
  const NewsLetterPage({Key? key}) : super(key: key);

  @override
  State<NewsLetterPage> createState() => _NewsLetterPageState();
}

class _NewsLetterPageState extends State<NewsLetterPage> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(title: "NEWS LETTERS"),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<BosconetNewsletter>>(
        future: apiServices.fetchNewsLetter(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final newsLetter = snapshot.data ?? [];
              return ListView.builder(
                itemCount: newsLetter.length,
                itemBuilder: (context, index) {
                  return NewsLetterCard(
                    title: newsLetter[index].title,
                    imageUrl: newsLetter[index].image,
                    date: newsLetter[index].date,
                    pdfLink: newsLetter[index].pdf,
                  );
                },
              );
            } else {
              print(snapshot.hasError);
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
