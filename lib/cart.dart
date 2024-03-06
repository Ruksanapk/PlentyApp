import 'package:flutter/material.dart';
import 'package:ecommerceapp/Checkoutpage.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var product in _cartProducts)
              CartProductContainer(
                product: product,
                updateCart: _updateCart, cartProducts: [],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Discount Code",
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
            ),
            
            PriceCalculation(cartProducts: _cartProducts),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkoutscreen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          ' Checkout',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateCart() {
    setState(() {});
  }
}
class CartProductContainer extends StatefulWidget {
  final Product product;
  final List<Product> cartProducts; // Pass the cartProducts list here
  final VoidCallback updateCart;

  const CartProductContainer({
    required this.product,
    required this.cartProducts,
    required this.updateCart,
  });

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
                Text("Color: ${widget.product.color}, Size: ${widget.product.size}"),
                Text("AED\$${widget.product.price}"),
                SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          widget.product.quantity =
                              (widget.product.quantity > 1) ? widget.product.quantity - 1 : 1;
                          widget.updateCart();
                        });
                      },
                    ),
                    Text("${widget.product.quantity}"),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          widget.product.quantity++;
                          widget.updateCart();
                        });
                      },
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          widget.cartProducts.remove(widget.product);
                          widget.updateCart();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceCalculation extends StatelessWidget {
  final List<Product> cartProducts;

  PriceCalculation({required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    double subtotal = 900;
    for (var product in cartProducts) {
      subtotal += (product.price * product.quantity);
    }

    double shipping = 0;
    double discount = 10;
    double total = subtotal + shipping - discount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Subtotal:        AED\$${subtotal.toStringAsFixed(2)}"),
        Text("Shipping:        \$${shipping.toStringAsFixed(2)}"),
        Text("Discount:        AED\$${discount.toStringAsFixed(2)}"),
        Text("Total:           AED\$${total.toStringAsFixed(2)}"),
      ],
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
