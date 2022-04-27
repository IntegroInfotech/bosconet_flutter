import 'package:bosconet/screens/gift_education.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:flutter/material.dart';

class CoverPhotoWidget extends StatelessWidget {
  const CoverPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 260,
                  padding: const EdgeInsets.only(left: 15),
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  child: Image.network(
                    "http://bosco-net.in//images//App-image.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 260,
            width: double.infinity,
            child: Image.asset(
              "assets/images/img19715.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 260,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 2.9,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.25,
                  color: Colors.transparent,
                  height: 45,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Constants.primaryColor,
                      child: const Text(""),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ButtonPages(
                                appBarTitle: "GIFT EDUCATION",
                                image: Constants.giftImage,
                                data: Constants.giftEducation,
                                donateLink: Constants.donate),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.25,
                  color: Colors.transparent,
                  height: 45,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Constants.primaryColor,
                      child: const Text(""),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ButtonPages(
                                appBarTitle: "SKILL A YOUTH",
                                image: Constants.skillImage,
                                data: Constants.skillAYouth,
                                donateLink: Constants.donate),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.85,
                  color: Colors.transparent,
                  height: 45,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Constants.primaryColor,
                      child: const Text(""),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonPages(
                                  appBarTitle: "CARE FOR THE EARTH",
                                  image: Constants.careImage,
                                  data: Constants.careForEarth,
                                  donateLink: Constants.donate),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
