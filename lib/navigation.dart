// import "package:ecommerceapp/Favourite.dart";
// import "package:ecommerceapp/cart.dart";
import "package:ecommerceapp/home.dart";
import 'package:ecommerceapp/profile/profile.dart';
import "package:flutter/material.dart";

import 'package:google_nav_bar/google_nav_bar.dart';

import 'cart.dart';

var tstyle = TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 50);

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  double gap = 10;

  int _index = 0;

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: 4,
          controller: controller,
          onPageChanged: (page) {
            setState(() {
              _index = page;
            });
          },
          itemBuilder: (context, position) {
            switch (position) {
              case 0:
                return Homescreen();
              case 1:
                return CartScreen();
              case 2:
                return CartScreen();
              case 3:
                return Profilescreen();
              default:
                return Container();
            }
          }),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              spreadRadius: -10,
              blurRadius: 60,
              color: Colors.black.withOpacity(0.4),
              offset: Offset(0, 25),
            )
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            child: GNav(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 200),
              tabs: [
                GButton(
                  gap: gap,
                  icon: Icons.home_outlined,
                  iconColor: Colors.black,
                  iconActiveColor: Color(0xff3fbf78),
                  text: 'Home',
                  textColor: Color(0xfffbf9fb),
                  backgroundColor: Colors.black,
                  iconSize: 24,
                  padding: padding,
                ),
                GButton(
                  gap: gap,
                  icon: Icons.shopping_bag_outlined,
                  iconColor: Colors.black,
                  iconActiveColor: Colors.white,
                  text: 'bag',
                  textColor: Colors.white,
                  backgroundColor: Colors.black,
                  iconSize: 24,
                  padding: padding,
                ),
                GButton(
                  gap: gap,
                  icon: Icons.favorite_outline,
                  iconColor: Colors.black,
                  iconActiveColor: Color(0xffd7d4d5),
                  text: 'favourite',
                  textColor: Color(0xfff8f1f3),
                  backgroundColor: Colors.black,
                  iconSize: 24,
                  padding: padding,
                ),
                GButton(
                  gap: gap,
                  icon: Icons.person_outlined,
                  iconColor: Colors.black,
                  iconActiveColor: Color(0xfff4f9f9),
                  text: 'profile',
                  textColor: Color(0xfffafefe),
                  backgroundColor: Colors.black,
                  iconSize: 24,
                  padding: padding,
                ),
              ],
              selectedIndex: _index,
              onTabChange: (index) {
                setState(() {
                  _index = index;
                });
                controller.jumpToPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
