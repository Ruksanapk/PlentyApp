import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black, padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: () => {},
        child: Row(
          children: [
            Image.asset(
              "assets/Ellipse 9.png",
              height: 43,
              width: 43,
              
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(
              "Ali Mohammed Abduallah ",
              style: TextStyle(fontSize:15,
              height: 21,
              color: Colors.black,
              )
              ,

            )),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
  
