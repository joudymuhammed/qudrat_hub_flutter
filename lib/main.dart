import 'package:flutter/material.dart';
import 'package:qudrat_hub/Screens/Employee/AccountPage.dart';
import 'package:qudrat_hub/Screens/Employee/HomePage/HomePage.dart';
import 'package:qudrat_hub/Screens/Employee/JobListingPage.dart';
import 'package:qudrat_hub/Screens/Employee/MyApplicationsPage.dart';

import 'Component/BottomNavItem.dart';
import 'Screens/Employee/ChatsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomBottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    JobListingPage(),
    ApplicationsPage(),
    HomePage(),
    ChatsPage(),
    AccountPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF616161), Color(0xFF00796B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40),bottom: Radius.circular(97)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItem(
                      icon: Icons.work,
                      label: 'Job Listing',
                      isSelected: _selectedIndex == 0,
                      onTap: () => _onItemTapped(0),
                    ),
                    BottomNavItem(
                      icon: Icons.description,
                      label: 'Applications',
                      isSelected: _selectedIndex == 1,
                      onTap: () => _onItemTapped(1),
                    ),
                    SizedBox(width: 60),
                    BottomNavItem(
                      icon: Icons.shopping_cart,
                      label: 'Chats',
                      isSelected: _selectedIndex == 3,
                      onTap: () => _onItemTapped(3),
                    ),
                    BottomNavItem(
                      icon: Icons.person,
                      label: 'Account',
                      isSelected: _selectedIndex == 4,
                      onTap: () => _onItemTapped(4),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -25,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                ),
                child: IconButton(
                  icon: Icon(Icons.home, color: Colors.black),
                  onPressed: () => _onItemTapped(2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
