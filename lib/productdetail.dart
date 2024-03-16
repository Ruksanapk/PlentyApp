import 'package:flutter/material.dart';

import 'cart.dart';
import 'checkoutpage.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Image.asset(
                      product.image,
                      height: 500,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.black),
                      onPressed: () {
                        
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 400, 
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$99.99', 
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(height: 10),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text("(130 Review)",
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(width: 40),
                                Container(
                                    color: Colors.white,
                                    child: Row(children: [
                                      IconButton(
                                        icon: Icon(Icons.remove,
                                            color: Colors.black),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontFamily: "Almarena"),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add,
                                            color: Colors.black),
                                        onPressed: () {},
                                      ),
                                    ]))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sizes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        _buildSizeOption('S'),
                        SizedBox(width: 20),
                        _buildSizeOption('M'),
                        SizedBox(width: 20),
                        _buildSizeOption('L'),
                        SizedBox(width: 20),
                        _buildSizeOption('XL'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Colors',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        _buildColorOption(Colors.red),
                        SizedBox(width: 20),
                        _buildColorOption(Colors.green),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'CML Harajuku Aesthetic Bear Anime Hoodie Women Kawaii Crewneck Long Sleeve Oversized Streetwear Fall Winter Clothes Tops (Color : Beige, Size : L)',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(270, 50),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.shopping_cart_outlined,
                                    color: Color(0xfffbf9f9)),
                                onPressed: () {
                                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
                                },
                              ),
                              Text('Add to Cart'),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeOption(String size) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          radius: 19,
          backgroundColor: Colors.white,
          child: Text(
            size,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff0a0a0a),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: color,
      ),
    );
  }
}
