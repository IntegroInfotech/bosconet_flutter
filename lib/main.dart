import 'dart:ui';
import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/screens/home_screen.dart';
import 'package:bosconet/screens/nav_drawer.dart';
import 'package:bosconet/screens/notification_screen.dart';
import 'package:bosconet/screens/second_screen.dart';
import 'package:bosconet/widgets/open_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BOSCONET());
}

class BOSCONET extends StatefulWidget {
  @override
  State<BOSCONET> createState() => _BOSCONETState();
}

class _BOSCONETState extends State<BOSCONET> {
  int selectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print("currentIndex is : $index");
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      if (selectedIndex == 3) {
        openUrl(context,
            url: "https://www.bosconet.in/", color: Constants.primaryColor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BOSCONET",
      home: Scaffold(
        appBar: AppBar(
          title: const TextTitle(
            title: 'BOSCONET',
            fontSize: 24,
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Constants.primaryColorWhite,
          leading: Builder(
            builder: (context) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(Icons.menu),
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Constants.primaryColor),
        ),
        drawer: DrawerMenu(),
        body: PageView(
          controller: pageController,
          allowImplicitScrolling: true,
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: const [
            HomeScreen(),
            SeconScreen(),
            NotificationPage(),
            //WebScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.white,
          iconSize: 30,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(fontSize: 18),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              backgroundColor: Constants.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_sharp),
              label: "",
              backgroundColor: Constants.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: "",
              backgroundColor: Constants.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.web_outlined),
              label: "",
              backgroundColor: Constants.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
