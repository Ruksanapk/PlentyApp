import 'package:flutter/material.dart';


class PopularProductsPage extends StatelessWidget {
  final List<Product> popularProducts = [
    Product(name: "jeans jacket", image: "assets/Rectangle 19868 (1).png"),
    Product(name: "Classics Shirt ", image: "assets/pop1.png"),
    Product(name: "jeans jacket", image: "assets/Rectangle 19868 (1).png"),
    Product(name: "jeans jacket", image: "assets/Rectangle 19868 (1).png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: popularProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: popularProducts[index]),
                ),
              );
            },
            child: ProductTile(product: popularProducts[index]),
          );
        },
      ),
    );
  }
}
class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0), 
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              width: double.infinity,
              height: 230.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'Almarena'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String image;

  Product({required this.name, required this.image});
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            product.image,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
       
        ],
      ),
    );
  }
}
