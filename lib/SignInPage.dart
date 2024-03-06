
import "package:flutter/material.dart";
import 'package:ecommerceapp/OTPpage.dart';
import 'package:ecommerceapp/navigation.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
  
  margin:  EdgeInsets.fromLTRB(0, 10, 146.66, 20),
  constraints:  BoxConstraints (
    maxWidth:  235,
  ),
  child:  
RichText(
  text:  
TextSpan(
  style:  TextStyle (
    fontFamily: 'Almarena',
    fontSize:  40,
    fontWeight:  FontWeight.w600,
    height:  1.025,
    letterSpacing:  -1.6,
    color:  Color(0xff000000),
  ),
  children:  [
TextSpan(
  text:  'Welcome',
  style:  TextStyle (
    fontFamily:'Almarena',
    fontSize:  20,
    fontWeight:  FontWeight.w400,
    height:  2.05,
    letterSpacing:  -1.6,
    color:  Color(0xff000000),
  ),
),
TextSpan(
  text:  '👋🏻\n',
  style:TextStyle (
    fontSize:  20,
    fontWeight:  FontWeight.w400,
    height:  2.05,
    letterSpacing:  -1.6,
    color:  Color(0xff000000),
  ),
),

TextSpan(
  text:  'Sign in to continue',
  style:  TextStyle (
    fontFamily:'Almarena',
    fontSize:  35,
    fontWeight:  FontWeight.w400,
    height:  1.1714285714,
    letterSpacing:  -1.6,
    color:  Color(0xff000000),
  ),
),
  ],
),
),
),
            Container(
              width: 350.49,
              height: 60,
              margin: EdgeInsets.fromLTRB(17.17, 100, 3, 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  Text(
                    '+1',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your number',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OTPVerificationPage()),
                );},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Continue',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarena'
              ),

              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBottomNavBar()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                minimumSize: Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(width: 1),
              ),
              child: Text('Continue as Guest',style: TextStyle(
                color: Colors.black,
                
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarena'
              ),),
            ),
            Container(
  margin: EdgeInsets.fromLTRB(10.84, 0, 10.3, 26),
  width: double.infinity,
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(30, 0, 28.48, 0),
        child: Text(
          'Or Continue with',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Almarena',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.2575,
            letterSpacing: -0.6,
            color: Color(0xffbfbfbf),
          ),
        ),
      ),
    ],
  ),
),
Container(
  margin: EdgeInsets.fromLTRB(10.84, 0, 9.76, 21),
  width: double.infinity,
  height: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  child: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      padding: EdgeInsets.fromLTRB(118.53, 14, 15.18, 13),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffededed)),
        color: Color(0xffbfbfbf),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 4, 79.5, 0),
            child: Text(
              'Continue with Google',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Almarena',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.2575,
                letterSpacing: -0.6,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
            width: 23.85,
            height: 22,
            child: Image.asset(
              'assets/google.png',
              width: 23.85,
              height: 22,
            ),
          ),
        ],
      ),
    ),
  ),
),
Container(
  margin: EdgeInsets.fromLTRB(10.84, 0, 9.76, 0),
  width: double.infinity,
  height: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  child: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      padding: EdgeInsets.fromLTRB(129.53, 13, 19.52, 13),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffededed)),
        color: Color(0xffbfbfbf),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 86.16, 0),
            child: Text(
              'Sign in with Apple',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Almarena',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.2575,
                letterSpacing: -0.6,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
            width: 23.85,
            height: 22,
            child: Image.asset(
              'assets/Apple black logo.png',
              width: 23.85,
              height: 22,
            ),
          ),
        ],
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
