import 'package:flutter/material.dart';


class ProductDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Rectangle 19868 (1).png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            TopCurvedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blueshirt',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'AED 500',
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text('4.5 (120 reviews)'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuantitySelector(),
                      SizeSelector(),
                      ColorSelector(),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Product Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 276,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
                child: Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
class TopCurvedContainer extends StatelessWidget {
  final Widget child;

  const TopCurvedContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child,
          SizedBox(height: 16), 
        ],
      ),
    );
  }
}
class QuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.remove), onPressed: () {}),
        Text('1'),
        IconButton(icon: Icon(Icons.add), onPressed: () {}),
      ],
    );
  }
}

class SizeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizeOption(size: 'S'),
        SizeOption(size: 'M'),
        SizeOption(size: 'L'),
        SizeOption(size: 'XL'),
        SizeOption(size: 'XXL'),
      ],
    );
  }
}

class SizeOption extends StatelessWidget {
  final String size;

  const SizeOption({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
      child: Text(size),
    );
  }
}

class ColorSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ColorOption(color: Colors.red),
        ColorOption(color: Colors.blue),
        ColorOption(color: Colors.green),
        ColorOption(color: Colors.yellow),
      ],
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;

  const ColorOption({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

