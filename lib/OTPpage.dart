
import "package:ecommerceapp/navigation.dart";
import 'dart:async';
import 'package:flutter/material.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  int _counter = 60; 
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel(); 
        }
      });
    });
  }

  void resendOTP() {
    
    setState(() {
      _counter = 60; 
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); 
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body:  Column(
          children: [
            Text("OTP Verification",
            style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almarena'),
                  ),
          
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOTPDigitContainer(),
                buildOTPDigitContainer(),
                buildOTPDigitContainer(),
                buildOTPDigitContainer(),
              ],
            ),

            SizedBox(height: 20),
            Text(
              "Resend OTP in $_counter seconds",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

         
            ElevatedButton(
              onPressed: _counter > 0 ? null : resendOTP,
              child: Text("Resend OTP"),
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
                backgroundColor: Colors.black,
                minimumSize: Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Confirm",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarena'
              ),),
            ),
          ],
        ),
      ),
    ],),);
  }

  Widget buildOTPDigitContainer() {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          counterText: "", 
          border: InputBorder.none,
        ),
      ),
    );
  }
}
