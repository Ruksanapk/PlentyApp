import 'package:flutter/material.dart';
import 'package:ecommerceapp/checkoutpage.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("          Cart"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 376,
                height: 118,
                margin: EdgeInsets.only(top: 28, left: 20),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Container(
                      width: 54,
                      height: 67,
                      child: Image.asset(
                        "assets/Hoodie-1 (1).png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(color: Colors.white),
                      // Placeholder for product image
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Blue Shirt"),
                        SizedBox(height: 10),
                        Text("Color:2"),
                        SizedBox(height: 5),
                        Text("Size: L"),
                        Text("AED 200"),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Row(children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove),
                          ),
                          Text("1"),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 326,
                height: 46,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'FREE30',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                      
                      },
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            fontFamily: 'Almarena', color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Subtotal:                                              AED 200"),
                    Text(
                        "Shipping:                                               AED 20"),
                    Text(
                        "Discount:                                               AED 10"),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                            fontFamily: 'Almarena',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "AED 210",
                          style: TextStyle(
                            fontFamily: 'Almarena',
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 326,
                height: 46,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Checkoutscreen()),
                          );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 30),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}