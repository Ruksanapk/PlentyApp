// import 'package:ecommerceapp/popular.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'filter.dart';

// iimport 'package:ecommerceapp/Favourite.dart';
import 'package:ecommerceapp/cart.dart';

import 'package:ecommerceapp/popular.dart';

// import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter_svg/svg.dart';

class Homescreen extends StatelessWidget {
  final List<Category> categories = [
    Category('New in', "assets/chair 1.png"),
    Category('sales ', 'assets/chair 1 (1).png'),
    Category('Women', 'assets/chair 1 (6).png'),
    Category('kids', 'assets/chair 1 (5).png'),
    Category('shoes', 'assets/chair 1 (2).png'),
  ];

  final List<Products> newArrivals = [
    Products(
      'jeans jacket',
      'AED500',
      "assets/new.jpg",
    ),
    Products('jeans jacket', 'AED500', 'assets/new1.jpg'),
    Products('jeans jacket', 'AED500', "assets/new.jpg"),
  ];

  final List<Product> popularProducts = [
    Product('jeans jacket', 'AED500', 'assets/Rectangle 19844.png'),
    Product('jeans jacket', 'AED500', 'assets/Rectangle 19844 (1).png'),
    Product('jeans jacket', 'AED500', 'assets/Rectangle 19844 (2).png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 8, 10),
              color: Color(0xffffffff),
              child: Row(
                children: [
                  Text(
                    'Welcome👋🏻',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Almarena',
                    ),
                  ),
                  SizedBox(width: 62),
                  IconButton(
                    icon: Icon(Icons.favorite_outline_rounded,
                        color: Colors.black),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon:
                        Icon(Icons.shopping_cart_outlined, color: Colors.black),
                    onPressed: () {
                      // Handle favorite button tap
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.search_outlined),
                            hintText: 'Search deals by place name',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color(0xffC5C5C5),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Almarena',
                            )),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset("assets/Filter.svg"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterWidget()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text("Explore Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Almarena",
                  fontSize: 16,
                )),
            SizedBox(height: 16),
            Wrap(
              spacing: 14.0,
              runSpacing: 16.0,
              children: categories
                  .map((category) => CategoryWidget(category: category))
                  .toList(),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CarouselSlider(
                  items: [
                    // Your carousel images here
                    Image.asset("assets/3stylishtshirt 1 (2).png"),
                    Image.asset("assets/3stylishtshirt 1 (2).png"),
                    Image.asset("assets/3stylishtshirt 1 (2).png"),
                  ],
                  options: CarouselOptions(
                    height: 260.0,
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      // Handle page change
                    },
                  ),
                ),
                Positioned(
                  width: 203,
                  height: 96,
                  bottom: 0,
                  left: 114,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Modern',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Almarena',
                            fontSize: 45,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Essentials',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Almarena',
                                fontSize: 45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Text(
                    'Discover new styles',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildIndicator(isActive: true),
                    SizedBox(width: 10.0),
                    buildIndicator(),
                    SizedBox(width: 10.0),
                    buildIndicator(),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 8, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Popular",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Almarena',
                                  fontSize: 18,
                                ),
                          ),
                          SizedBox(width: 140),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PopularProductsPage()),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "View More",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "IBM Plex Sans",
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios),
                                  iconSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200.0,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularProducts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
                        },
                        child: Container(
                          width: 171.0,
                          margin: EdgeInsets.only(left: 14.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6.8),
                                width: 171.0,
                                height: 126.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    popularProducts[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(popularProducts[index].name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Almarena",
                                              color: Colors.black,
                                            )),
                                        Text(
                                          popularProducts[index].price,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite_outline,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 400.0,
              height: 223.0,
              child:
                  Image.asset('assets/Rectangle 19863.png', fit: BoxFit.cover),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 8, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Positioned(
                            top: -4,
                            child: Text(
                              "New Arrival",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Almarena',
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          SizedBox(width: 120),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PopularProductsPage()),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "View More",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "IBM Plex Sans",
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios),
                                  iconSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 260.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newArrivals.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 208.0,
                                margin: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          200.0, // Adjusted height for the image container
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              newArrivals[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            newArrivals[index].name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Almarena',
                                            ),
                                          ),
                                          Text(
                                            popularProducts[index].price,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Column(
        children: [
          Image.asset(
            category.image,
            width: 50.0,
            height: 50.0,
          ),
          SizedBox(height: 4.0),
          Text(
            category.name,
            style: TextStyle(fontSize: 13.0),
          ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final String image;

  Category(this.name, this.image);
}

Widget buildIndicator({bool isActive = false}) {
  return Container(
    width: 10.0,
    height: 10.0,
    margin: EdgeInsets.symmetric(horizontal: 2.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive ? Color(0xff0a0a0a) : Colors.grey,
    ),
  );
}

class Product {
  final String name;
  final String price;
  final String image;

  Product(this.name, this.price, this.image);
}

class Products {
  final String name;
  final String image;
  final String price;
  Products(this.name, this.price, this.image);
}
