import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:bosconet/constants/constants.dart';
import 'package:flutter/material.dart';

class SeconScreen extends StatelessWidget {
  const SeconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Image.asset(
              "assets/images/bag.png",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            const SizedBox(
              height: 50,
            ),
            const TextTitle(
              title: "OUR NETWORK",
              fontSize: 50,
              color: Constants.primaryColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                "The Donbosco Networks Develops to resources enable\n marginalised people to access opportunities to live in dignity",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'EB Garamond',
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    TextTitle(
                      title: "29",
                      fontSize: 40,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextTitle(
                      title: "STATES",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
                Container(
                  color: Constants.primaryColor,
                  height: 80,
                  width: 2,
                ),
                Column(
                  children: const [
                    TextTitle(
                      title: "354",
                      fontSize: 40,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextTitle(
                      title: "NGOs",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
                Container(
                  color: Constants.primaryColor,
                  height: 80,
                  width: 2,
                ),
                Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: ' 10* ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          TextSpan(
                            text: 'lakh ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextTitle(
                      fontWeight: FontWeight.bold,
                      title: "BENEFICIARIES",
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
