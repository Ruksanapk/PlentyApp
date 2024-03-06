import 'package:flutter/material.dart';

class Checkoutscreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<Checkoutscreen> {
  List<Product> _cartProducts = [
    Product(
      image: "assets/cart1.jpg",
      name: "Blue shirt",
      color: "blue",
      size: "L",
      price: 200,
      quantity: 2,
    ),
    Product(
      image: "assets/cart1.jpg",
      name: "Blue shirt",
      color: "blue",
      size: "L",
      price: 200,
      quantity: 2,
    ),
  ];

  List<Address> _addresses = [
    Address(
      name: "John Doe",
      street: "123 Main St",
      city: "Cityville",
      zipCode: "12345",
      isDefault: true,
    ),
    Address(
      name: "Jane Doe",
      street: "456 Elm St",
      city: "Townsville",
      zipCode: "67890",
      isDefault: false,
    ),
  ];

  Address? _selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopCurveContainer(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: "Almarena"),
                  ),
                  SizedBox(height: 8),
                  for (var address in _addresses)
                    RadioListTile<Address>(
                      title: Text(
                          "${address.name}\n${address.street}, ${address.city}, ${address.zipCode}"),
                      value: address,
                      groupValue: _selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          _selectedAddress = value;
                        });
                      },
                    ),
                  SizedBox(height: 16),
                  Text(
                    "Products:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  for (var product in _cartProducts)
                    CartProductContainer(product: product),
                  SizedBox(height: 16),
                  Text(
                    "Payment Options:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  PaymentOption(
                    image: "assets/visa 2.png",
                    text: "Visa",
                  ),
                  PaymentOption(
                    image: "assets/Apple pay.png",
                    text: "Apple Pay",
                  ),
                  PaymentOption(
                    image: "assets/image 32.png",
                    text: "Tabby",
                  ),
                  PaymentOption(
                    image: "assets/Lockup_black_English_2 1.png",
                    text: "Tamara",
                  ),
                  PaymentOption(
                    image: "assets/cod.png",
                    text: "Cash on Delivery",
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Items:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${_cartProducts.length}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price AED:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              calculateSubtotal().toStringAsFixed(2),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ship Fee AED 50:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "50.00",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price AED:",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              calculateTotalPrice().toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter Coupon Code",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                               
                              },
                              child: Text("Apply"),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            
                          },
                          style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
                          child: Text("Proceed to Payment",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarena'
              ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateSubtotal() {
    double subtotal = 0;
    for (var product in _cartProducts) {
      subtotal += (product.price * product.quantity);
    }
    return subtotal;
  }

  double calculateTotalPrice() {
    return calculateSubtotal() + 50; 
  }

  Widget _buildTopCurveContainer() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.black,
      ),
    );
  }
}

class CartProductContainer extends StatefulWidget {
  final Product product;

  const CartProductContainer({required this.product});

  @override
  _CartProductContainerState createState() => _CartProductContainerState();
}

class _CartProductContainerState extends State<CartProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            child: Image.asset(
              widget.product.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                    "Color: ${widget.product.color}, Size: ${widget.product.size}"),
                Text("AED \$${widget.product.price}, Qty ${widget.product.quantity}"),
                SizedBox(height: 8),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
                                  
                                  
}
   
class PaymentOption extends StatelessWidget {
  final String image;
  final String text;

  const PaymentOption({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}         
class Product {
  final String image;
  final String name;
  final String color;
  final String size;
  final double price;
  int quantity;

  Product({
    required this.image,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}

class Address {
  final String name;
  final String street;
  final String city;
  final String zipCode;
  final bool isDefault;

  Address({
    required this.name,
    required this.street,
    required this.city,
    required this.zipCode,
    required this.isDefault,
  });
}