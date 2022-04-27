import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/screens/news_letter_page.dart';
import 'package:bosconet/screens/photos_album_page.dart';
import 'package:bosconet/screens/success_stories_page.dart';
import 'package:bosconet/screens/videos_page.dart';
import 'package:bosconet/widgets/custom_dialogs/address_alert_dialog.dart';
import 'package:bosconet/widgets/custom_dialogs/alert_dialog.dart';
import 'package:bosconet/widgets/open_url.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  int selectedValue = 1;

  showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 240,
            child: const SizedBox.expand(child: FlutterLogo()),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Constants.primaryColorWhite,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Card(
                child: Image.asset(
                  "assets/images/donbosco.JPG",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            padding: const EdgeInsets.all(15),
                            color: Constants.primaryColorAccent,
                            child: Image.asset(
                              "assets/images/ourteam.png",
                            ),
                          ),
                          Expanded(
                            child: Material(
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  color: Constants.primaryColor,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: const TextTitle(title: "About Us"),
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const CustomAlertDialog();
                                      });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            padding: const EdgeInsets.all(20),
                            color: Constants.primaryBlueAccent,
                            child: Image.asset("assets/images/newsletter2.png"),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print('clicked');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NewsLetterPage(),
                                    ));
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                color: Constants.primaryBlue,
                                padding: const EdgeInsets.only(left: 10),
                                child: const TextTitle(title: "News Letter"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            padding: const EdgeInsets.all(15),
                            color: Constants.primaryColorGrayAccent,
                            child: Image.asset("assets/images/contact_us.png"),
                          ),
                          Expanded(
                            child: Material(
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  color: Constants.primaryColorGray,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: const TextTitle(title: "Contact Us"),
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AddressAlertDialog();
                                      });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Material(
                          child: InkWell(
                              onTap: () {
                                openUrl(context,
                                    url: Constants.facebook,
                                    color: Constants.primaryColor);
                              },
                              child: Image.asset("assets/images/fb1.png"))),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            openUrl(context,
                                url: Constants.twitter,
                                color: Constants.primaryColor);
                          },
                          child: Image.asset("assets/images/tw1.png"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            openUrl(context,
                                url: Constants.instagram,
                                color: Constants.primaryColor);
                          },
                          child: Image.asset("assets/images/ins1.png"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            openUrl(context,
                                url: Constants.youtube,
                                color: Constants.primaryColor);
                          },
                          child: Image.asset("assets/images/you1.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessStoriesPage(),
                          )),
                      child: Card(
                        child: Container(
                          alignment: Alignment.center,
                          color: Constants.primaryColor,
                          child: const TextTitle(title: "Success Stories"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PhotosAlbumsPage(),
                                  ),
                                );
                              },
                              child: Card(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  color: Constants.primaryColorWhite,
                                  child: const TextTitle(
                                    title: "Photos",
                                    color: Constants.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Card(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  color: Constants.primaryColorWhite,
                                  child: const TextTitle(
                                    title: "Videos",
                                    color: Constants.primaryColor,
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VideosPage(),
                                ),
                              ),

                              /*openUrl(context,
                                  url:
                                      "https://www.youtube.com/channel/UCmcBGN0XfnAxHA2rUdBNFLg/videos",
                                  color: Constants.primaryColor),*/
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: 20, top: 20 + 20, right: 20, bottom: 20),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                const BoxShadow(
                    color: Colors.black,
                    offset: const Offset(0, 10),
                    blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "title",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "descriptions",
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "text",
                      style: const TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset("assets/model.jpeg")),
          ),
        ),
      ],
    );
  }
}
