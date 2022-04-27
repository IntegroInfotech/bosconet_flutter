import 'package:bosconet/widgets/news_card_slider.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/widgets/coverphoto_widget.dart';
import 'package:bosconet/widgets/open_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.primaryColorGrayAccent,
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 260,
            child: CoverPhotoWidget(),
          ),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: Card(
              child: Material(
                child: InkWell(
                  child: Image.asset(
                    "assets/images/bannerapp.jpg",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    openUrl(context,
                        url: "https://donations.bosconet.in/campaign/covid19",
                        color: Constants.primaryColor);
                  },
                ),
              ),
            ),
          ),
          const Expanded(child: NewsCardSlider()),
        ],
      ),
    );
  }
}
