import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/screens/homepage/homepage_screen.dart';
import 'package:recything_application/screens/homepage/widgets/bottom_navbar/buttom_nav_item_widget.dart';
import 'package:recything_application/screens/homepage/widgets/bottom_navbar/rounded_floating_action_button_widget.dart';

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
              iconPath: IconConstant.iconHome,
              label: 'Home',
              index: 0,
              currentIndex: widget.currentIndex,
              onTap: _onItemTapped,
              isSvg: true,
            ),
            BottomNavItem(
              iconPath: IconConstant.iconRecycling,
              label: 'Recycle',
              index: 1,
              currentIndex: widget.currentIndex,
              onTap: _onItemTapped,
              isSvg: true,
            ),
            const SizedBox(width: 48),
            BottomNavItem(
              iconPath: IconConstant.iconChallenge,
              label: 'Recycle',
              index: 3,
              currentIndex: widget.currentIndex,
              onTap: _onItemTapped,
              isSvg: true,
            ),
            BottomNavItem(
              iconPath: IconConstant.iconUser,
              label: 'Profile',
              index: 4,
              currentIndex: widget.currentIndex,
              onTap: _onItemTapped,
              isSvg: true,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: const RoundedFloatingActionButton(),
    );
  }
}