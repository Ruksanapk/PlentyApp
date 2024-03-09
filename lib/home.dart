import 'package:ecommerceapp/Favourite.dart';
import 'package:ecommerceapp/cart.dart';
import 'package:ecommerceapp/popular.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter_svg/svg.dart';


class Homescreen extends StatelessWidget {
  final List<Category> categories = [
    Category('New in',"assets/chair 1.png"),
    Category('sales ', 'assets/chair 1 (1).png'),
    Category('Women', 'assets/chair 1 (6).png'),
    Category('kids', 'assets/chair 1 (5).png'),
    Category('shoes', 'assets/chair 1 (2).png'),
  ];

  final List<Products> newArrivals = [
    Products('jeans jacket', "assets/new.jpg"),
    Products('jeans jacket', 'assets/new1.jpg'),
    Products('jeans jacket', "assets/new.jpg"),
  ];
  
  final List<Product> popularProducts = [
    Product('jeans jacket', 'AED500', 'assets/Rectangle 19844.png'),
    Product('jeans jacket', 'AED500', 'assets/Rectangle 19844 (1).png'),
    Product('jeans jacket', 'AED500', 'assets/Rectangle 19844 (2).png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
          'Welcome👋🏻',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Almarena',
          ),
          maxLines: 1, 
        ),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.favorite_outline),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favscreen()),
                );
              },
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon:SvgPicture.asset("assets/Filter.svg"),
                  onPressed: () {
                    _showFilterBottomSheet(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 12.0,
              runSpacing: 14.0,
              children: categories
                  .map((category) => CategoryWidget(category: category))
                  .toList(),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: AnotherCarousel(
                    images: const [
                      AssetImage("assets/3stylishtshirt 1 (2).png"),
                      AssetImage("assets/3stylishtshirt 1 (2).png"),
                      AssetImage("assets/3stylishtshirt 1 (2).png"),
                    ],
                   
                    dotSize: 6,
                    indicatorBgPadding: 5.0,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text(
                        'Popular',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PopularProductsPage()),
                  );
                        },
                        child: Row(
                          children: [
                            Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Almarena',
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.black),
                          ],
                        ),
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
                          margin: EdgeInsets.only(left: 16.0),
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
                                        Text(
                                          popularProducts[index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Almarena",
                                            color: Colors.black,)),
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
                                      onPressed: () {
                                        
                                      },
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
          SizedBox(height:10),
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
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text(
                        'New Arrival',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'View All',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Almarena',
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: 280.0,
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
                                margin: EdgeInsets.only(left: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 160.0,
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

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FilterWidget();
      },
    );
  }
}

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  
  bool tShirtsSelected = false;
  bool trousersSelected = false;
  bool cargoPantsSelected = false;
  bool hoodiesSelected = false;
  bool bestSellersSelected = false;
  bool shortsSelected = false;

  
  bool sizeSSelected = false;
  bool sizeMSelected = false;
  bool sizeLSelected = false;
  bool sizeXLSelected = false;
  bool sizeXXLSelected = false;
  bool sizeXXXLSelected = false;

  // Price Range
  double lowerValue = 0;
  double upperValue = 1000;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         buildCategoryButton('T-Shirts', tShirtsSelected),
        buildCategoryButton('Trousers', trousersSelected),
        buildCategoryButton('Cargo Pants', cargoPantsSelected),
        buildCategoryButton('Hoodies', hoodiesSelected),
        buildCategoryButton('Best Sellers', bestSellersSelected),
        buildCategoryButton('Shorts', shortsSelected),

        SizedBox(height: 8.0), // Adjusted spacing

        buildSizeButton('S', sizeSSelected),
        buildSizeButton('M', sizeMSelected),
        buildSizeButton('L', sizeLSelected),
        buildSizeButton('XL', sizeXLSelected),
        buildSizeButton('XXL', sizeXXLSelected),
        buildSizeButton('XXXL', sizeXXXLSelected),

        SizedBox(height: 8.0),

        
        Text('Price Range'),
        RangeSlider(
          values: RangeValues(lowerValue, upperValue),
          min: 0,
          max: 1000,
          onChanged: (values) {
            setState(() {
              lowerValue = values.start;
              upperValue = values.end;
            });
          },
        ),

        SizedBox(height: 16),

        
        GestureDetector(
          onTap: () {
            print('Applying Filter: '
                'T-Shirts: $tShirtsSelected, '
                'Trousers: $trousersSelected, '
                'Size S: $sizeSSelected, '
                'Price Range: $lowerValue - $upperValue');
          },
          child: Container(
            padding: EdgeInsets.all(12),
            color: Colors.black,
            child: Center(
              child: Text(
                'Apply Filter',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

Widget buildCategoryButton(String category, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (category) {
            case 'T-Shirts':
              tShirtsSelected = !tShirtsSelected;
              break;
            case 'Trousers':
              trousersSelected = !trousersSelected;
              break;
            case 'Cargo Pants':
              cargoPantsSelected = !cargoPantsSelected;
              break;
            case 'Hoodies':
              hoodiesSelected = !hoodiesSelected;
              break;
            case 'Best Sellers':
              bestSellersSelected = !bestSellersSelected;
              break;
            case 'Shorts':
              shortsSelected = !shortsSelected;
              break;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.white : Colors.black,
          ),
          color: isSelected ? Colors.black : Colors.white,
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
  Widget buildSizeButton(String size, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (size) {
            case 'S':
              sizeSSelected = !sizeSSelected;
              break;
            case 'M':
              sizeMSelected = !sizeMSelected;
              break;
            case 'L':
              sizeLSelected = !sizeLSelected;
              break;
            case 'XL':
              sizeXLSelected = !sizeXLSelected;
              break;
            case 'XXL':
              sizeXXLSelected = !sizeXXLSelected;
              break;
            case 'XXXL':
              sizeXXXLSelected = !sizeXXXLSelected;
              break;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.white : Colors.black,
          ),
          color: isSelected ? Colors.black : Colors.white,
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
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
      width: 60.0, // Adjusted width
      child: Column(
        children: [
          Image.asset(
            category.image,
            width: 40.0, 
            height: 40.0, 
          ),
          SizedBox(height: 4.0), 
          Text(
            category.name,
            style: TextStyle(fontSize: 12.0), 
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

class Product {
  final String name;
  final String price;
  final String image;

  Product(this.name, this.price, this.image);
}
class Products {
  final String name;
  final String image;
  Products(this.name, this.image);
}