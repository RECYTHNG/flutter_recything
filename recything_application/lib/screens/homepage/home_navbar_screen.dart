import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/homepage/homepage_screen.dart';
import 'package:recything_application/screens/homepage/widgets/buttom_nav_item_widget.dart';
import 'package:recything_application/screens/homepage/widgets/rounded_floating_action_button_widget.dart';

class HomeNavBarScreen extends StatefulWidget {
  int currentIndex = 0;
  HomeNavBarScreen({super.key, required this.currentIndex});

  @override
  State<HomeNavBarScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeNavBarScreen> {
  final List<Widget> _pages = [
    const HomePageScreen(),
    const HomePageScreen(),
    const HomePageScreen(),
    const HomePageScreen(),
    const HomePageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        widget.currentIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(widget.currentIndex),
      bottomNavigationBar: BottomAppBar(
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
        ),
        height: 72,
        color: ColorConstant.primaryColor500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              icon: Icons.home_rounded,
              label: 'Home',
              index: 0,
              currentIndex: widget.currentIndex,
              onTap: _onItemTapped,
            ),
            BottomNavItem(
              icon: Icons.recycling,
              label: 'Recycle',
              index: 1,
              currentIndex: widget.currentIndex,
              onTap: _onItemTapped,
            ),
            const SizedBox(
              width: 48,
            ),
            BottomNavItem(
              icon: Icons.playlist_add_check_rounded,
              label: 'Challenge',
              index: 2,
              currentIndex: widget.currentIndex,
              onTap: _onItemTapped,
            ),
            BottomNavItem(
              icon: Icons.person,
              label: 'Profile',
              index: 3,
              currentIndex: widget.currentIndex,
              onTap: _onItemTapped,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const RoundedFloatingActionButton(),
    );
  }
}
