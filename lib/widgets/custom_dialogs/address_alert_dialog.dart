import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/widgets/open_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class AddressAlertDialog extends StatelessWidget {
  const AddressAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      //this right here
      child: SizedBox(
        height: 300,
        child: Card(
          color: Constants.primaryColor,
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Center(
                  child: TextTitle(
                    title: Constants.address,
                    color: Constants.primaryColorWhite,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        child: FlatButton(
                          onPressed: () => makeCall(),
                          child: const TextTitle(
                            title: "Call",
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: FlatButton(
                          onPressed: () => sendEmail(),
                          child: const TextTitle(
                            title: "Email",
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        child: FlatButton(
                          onPressed: () => openUrl(context,
                              url:
                                  "https://www.google.co.in/maps/place/BoscoNet/@28.6053797,77.0839678,21z/data=!4m12!1m6!3m5!1s0x390d1b4d251658bf:0x2d808d277319298b!2sBoscoNet!8m2!3d28.6054046!4d77.0840362!3m4!1s0x390d1b4d251658bf:0x2d808d277319298b!8m2!3d28.6054046!4d77.0840362?hl=en&authuser=0",
                              color: Constants.primaryColor),
                          child: const TextTitle(
                            title: "Go To Map",
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: FlatButton(
                          onPressed: () => openUrl(context,
                              url: "https://www.bosconet.in/",
                              color: Constants.primaryColor),
                          child: const TextTitle(
                            title: "Website",
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  makeCall() {
    UrlLauncher.launch("tel:+91-11-25390585");
  }

  sendEmail() {
    UrlLauncher.launch("mailto:info@bosconet.in");
  }

  goToMap() {}

  openWebsite() {}
}
