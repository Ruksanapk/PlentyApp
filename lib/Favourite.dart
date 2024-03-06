import 'package:flutter/material.dart';

class Favscreen extends StatelessWidget {
  const Favscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
