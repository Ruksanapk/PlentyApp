import 'package:ecommerceapp/profile/ProfilePic.dart';
import 'package:flutter/material.dart';
import 'profilemenu.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 10),
          Text(
            "Account Manager",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: "Almarena"),
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
                fontWeight: FontWeight.w600,
                fontFamily: "Almarena"),
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
    );
  }
}
