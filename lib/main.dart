import 'package:flutter/material.dart';
import 'SignInPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5AFA8C), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Rectangle 19868.png',
              height: 600,
              width: 400,  
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10), 
            Text(
              'Find Your dream style and start shopping here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 29,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarena'
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                ),
                child: Text('Get Started',
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarena'
              ),),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
