import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/screens/gift_education.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      //this right here
      child: Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Material(
                  child: InkWell(
                    child: Card(
                      color: Constants.primaryColor,
                      child: Container(
                        alignment: Alignment.center,
                        child: const TextTitle(title: "WHO WE ARE"),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ButtonPages(
                                appBarTitle: "WHO WE ARE",
                                image: Constants.about_usImage,
                                data: Constants.whoWeAre,
                                donateLink: Constants.donate),
                          ));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Material(
                  child: InkWell(
                    child: Card(
                      color: Constants.primaryColor,
                      child: Container(
                        alignment: Alignment.center,
                        child: const TextTitle(title: "OUR VISION"),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ButtonPages(
                                appBarTitle: "OUR VISION",
                                image: Constants.our_visitionImage,
                                data: Constants.ourVision,
                                donateLink: Constants.donate),
                          ));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Material(
                  child: InkWell(
                    child: Card(
                      color: Constants.primaryColor,
                      child: Container(
                        alignment: Alignment.center,
                        child: const TextTitle(title: "OUR MISSION"),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ButtonPages(
                                appBarTitle: "OUR MISSION",
                                image: Constants.our_missionImage,
                                data: Constants.ourMission1,
                                donateLink: Constants.donate),
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
