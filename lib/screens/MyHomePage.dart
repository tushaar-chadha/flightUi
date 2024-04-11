// ignore_for_file: non_constant_identifier_names

import 'package:flightui/screens/homepage.dart';
import 'package:flightui/screens/ticketScreen.dart';
import 'package:flightui/utils/constants.dart';
import 'package:flightui/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List pagesToDisplay = [
    homePage(),
    const Text("compass"),
    ticketScreen(),
    Text("Notification")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          enableFeedback: true,
          items: [
            bottomNavBarItem(Ionicons.home_outline, Ionicons.home),
            bottomNavBarItem(Ionicons.compass_outline, Ionicons.compass),
            bottomNavBarItem(MaterialCommunityIcons.ticket_outline,
                MaterialCommunityIcons.ticket_confirmation),
            bottomNavBarItem(
                Ionicons.notifications_outline, Ionicons.notifications),
          ],
          selectedItemColor: AppColors.blackColor,
          unselectedItemColor: Colors.grey.shade500,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          elevation: 20,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      body: pagesToDisplay[currentIndex],
    );
  }
}

BottomNavigationBarItem bottomNavBarItem(IconData icon, IconData ActiveIcon) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Icon(
        icon,
        size: 28,
      ),
    ),
    label: "",
    activeIcon: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Icon(
        ActiveIcon,
        size: 30,
      ),
    ),
  );
}
