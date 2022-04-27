import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/widgets/open_url.dart';
import 'package:flutter/material.dart';
import 'package:bosconet/constants/constants.dart';

class ButtonPages extends StatelessWidget {
  String appBarTitle, image, data, donateLink;

  ButtonPages(
      {Key? key,
      required this.appBarTitle,
      required this.image,
      required this.data,
      required this.donateLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextTitle(title: appBarTitle, fontSize: 25),
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 275,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                    openUrl(context,
                        url: donateLink, color: Constants.primaryColor);
                  },
                  child: const TextTitle(
                    title: "DONATE",
                    color: Constants.primaryColorWhite,
                  ),
                  color: Constants.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: Constants.primaryColorWhite,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextTitle(
                color: Constants.primaryColor,
                title: data,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
