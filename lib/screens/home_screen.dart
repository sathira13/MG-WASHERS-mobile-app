import 'package:car_wash/components/bottom_nav_bar.dart';
import 'package:car_wash/components/custom_app_bar.dart';
import 'package:car_wash/components/custom_text_heading.dart';
import 'package:car_wash/components/input_box.dart';
import 'package:car_wash/components/offer_card.dart';
import 'package:car_wash/components/service_card.dart';
import 'package:car_wash/screens/sub_screens/bookings.dart';
import 'package:car_wash/screens/sub_screens/home.dart';
import 'package:car_wash/screens/sub_screens/profile.dart';
import 'package:car_wash/screens/sub_screens/services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Widget? screen;

  @override
  void initState() {
    super.initState();

    screen = Home(
      isHome: true,
      onSeeAllServices: _seeAllServices,
    );
  }

  void _seeAllServices() {
    setState(() {
      _selectedIndex = 1;
      screen = Services();
    });
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = index;
        screen = Home(
          isHome: true,
          onSeeAllServices: _seeAllServices,
        );
      });
    } else if (index == 1) {
      setState(() {
        _selectedIndex = index;
        screen = Services();
      });
    } else if (index == 2) {
      setState(() {
        _selectedIndex = index;
        screen = Bookings();
      });
    } else {
      setState(() {
        _selectedIndex = index;
        screen = Profile();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screen,
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
