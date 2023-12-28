import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_view/about_view.dart';
import 'bottom_view/add_destination_view.dart';
import 'bottom_view/get_booking_view.dart';
import 'bottom_view/homepage_view.dart';
import 'bottom_view/profile_view.dart';

class NavigatorBarView extends ConsumerStatefulWidget {
  const NavigatorBarView({super.key});

  @override
  ConsumerState<NavigatorBarView> createState() => _NavigatorBarViewState();
}

class _NavigatorBarViewState extends ConsumerState<NavigatorBarView> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomePageView(),
    const AddDestinationView(),
    const AboutView(),
    const GetBookingView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_rounded),
            label: 'Add Destination',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'About us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        // backgroundColor: const Color.fromARGB(255, 224, 153, 197),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
