
import "package:flutter/material.dart";

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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '  Filter',
            style: TextStyle(color: Colors.black, fontFamily: "Almarena"),
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0, // spacing between items
              runSpacing: 8.0, // spacing between lines
              children: [
                buildCategoryButton('T-Shirts', tShirtsSelected),
                buildCategoryButton('Trousers', trousersSelected),
                buildCategoryButton('Cargo Pants', cargoPantsSelected),
                buildCategoryButton('Hoodies', hoodiesSelected),
                buildCategoryButton('Best Sellers', bestSellersSelected),
                buildCategoryButton('Shorts', shortsSelected),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0, // spacing between items
              runSpacing: 8.0, // spacing between lines
              children: [
                buildSizeButton('S', sizeSSelected),
                buildSizeButton('M', sizeMSelected),
                buildSizeButton('L', sizeLSelected),
                buildSizeButton('XL', sizeXLSelected),
                buildSizeButton('XXL', sizeXXLSelected),
                buildSizeButton('XXXL', sizeXXXLSelected),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Price Range',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
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
        ),
      ),
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
