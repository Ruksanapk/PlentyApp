import 'package:ecommerceapp/profile/ProfilePic.dart';
import 'package:flutter/material.dart';

import 'profilemenu.dart';


class Profilescreen extends StatelessWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 16),
              Text(
              "Account Manager",
              style: TextStyle(
                fontSize: 15,

              ),
            ),
            ProfileMenu(
              text: "Order History ",
              icon: "assets/icons/business_13160157 1.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "wish list",
              icon: "assets/icons/Vector.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Payment Method",
              icon: "assets/icons/credit-card.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Address",
              icon: "assets/icons/Address.svg",
              press: () {},
            ),
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 15,

              ),
            ),
            ProfileMenu(
              text: "Change language",
              icon: "assets/icons/Language.svg",
              press: () {},
            ),
             ProfileMenu(
              text: "Contact Us",
              icon: "assets/icons/Headphones.svg",
              press: () {},
            ),
             ProfileMenu(
              text: "Logout",
              icon: "assets/icons/Logout.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}