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
    cartProducts: _cartProducts,
    updateCart: _updateCart,
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



// import 'package:ruksana_s_application2/widgets/app_bar/custom_app_bar.dart';
// import 'package:ruksana_s_application2/widgets/app_bar/appbar_leading_image.dart';
// import 'package:ruksana_s_application2/widgets/app_bar/appbar_subtitle.dart';
// import 'widgets/fiftyone_item_widget.dart';
// import 'package:ruksana_s_application2/widgets/custom_text_form_field.dart';
// import 'package:ruksana_s_application2/widgets/custom_outlined_button.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
// import 'package:flutter/material.dart';
// import 'package:ruksana_s_application2/core/app_export.dart';

// // ignore_for_file: must_be_immutable
// class Iphone1415ProMaxNineScreen extends StatelessWidget {
//   Iphone1415ProMaxNineScreen({Key? key}) : super(key: key);

//   TextEditingController applyController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: SizedBox(
//                 width: double.maxFinite,
//                 child: Column(children: [
//                   _buildNine(context),
//                   SizedBox(height: 28.v),
//                   Expanded(
//                       child: SingleChildScrollView(
//                           child: Container(
//                               padding: EdgeInsets.symmetric(horizontal: 17.h),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     _buildFiftyOne(context),
//                                     SizedBox(height: 28.v),
//                                     Padding(
//                                         padding: EdgeInsets.only(left: 17.h),
//                                         child: Text("Discount Coupon",
//                                             style:
//                                                 CustomTextStyles.bodyMedium13)),
//                                     SizedBox(height: 16.v),
//                                     Padding(
//                                         padding: EdgeInsets.only(
//                                             left: 17.h, right: 53.h),
//                                         child: CustomTextFormField(
//                                             controller: applyController,
//                                             hintText: "FREE30",
//                                             textInputAction:
//                                                 TextInputAction.done,
//                                             suffix: Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     30.h, 13.v, 16.h, 14.v),
//                                                 child: Text("Apply",
//                                                     style: TextStyle(
//                                                         color:
//                                                             Color(0XFF000000),
//                                                         fontSize: 13.fSize,
//                                                         fontFamily: 'Almarena',
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         decoration:
//                                                             TextDecoration
//                                                                 .underline))),
//                                             suffixConstraints: BoxConstraints(
//                                                 maxHeight: 41.v))),
//                                     SizedBox(height: 29.v),
//                                     Padding(
//                                         padding: EdgeInsets.only(
//                                             left: 17.h, right: 53.h),
//                                         child: _buildShipping(context,
//                                             shipping: "Subtotal:",
//                                             free: "AED900")),
//                                     SizedBox(height: 8.v),
//                                     Padding(
//                                         padding: EdgeInsets.only(
//                                             left: 17.h, right: 53.h),
//                                         child: _buildShipping(context,
//                                             shipping: "Shipping:",
//                                             free: "Free")),
//                                     SizedBox(height: 7.v),
//                                     Padding(
//                                         padding: EdgeInsets.only(
//                                             left: 17.h, right: 53.h),
//                                         child: _buildShipping(context,
//                                             shipping: "Discount:",
//                                             free: "AED100")),
//                                     SizedBox(height: 15.v),
//                                     Divider(
//                                         color: theme.colorScheme.primary,
//                                         indent: 17.h,
//                                         endIndent: 53.h),
//                                     SizedBox(height: 6.v),
//                                     Padding(
//                                         padding: EdgeInsets.only(
//                                             left: 17.h, right: 53.h),
//                                         child: _buildShipping(context,
//                                             shipping: "Total:",
//                                             free: "AED800")),
//                                     SizedBox(height: 38.v),
//                                     CustomOutlinedButton(
//                                         height: 46.v,
//                                         text: "Checkout",
//                                         margin: EdgeInsets.only(
//                                             left: 17.h, right: 53.h),
//                                         rightIcon: Container(
//                                             margin: EdgeInsets.only(left: 30.h),
//                                             child: CustomImageView(
//                                                 imagePath: ImageConstant
//                                                     .imgArrowleftWhiteA700,
//                                                 height: 14.v,
//                                                 width: 25.h)),
//                                         buttonStyle:
//                                             CustomButtonStyles.outlinePrimary1,
//                                         buttonTextStyle: CustomTextStyles
//                                             .bodyMediumWhiteA700_1),
//                                     SizedBox(height: 22.v),
//                                     Padding(
//                                         padding: EdgeInsets.only(left: 16.h),
//                                         child: Text("You may also like",
//                                             style:
//                                                 CustomTextStyles.bodyMedium13)),
//                                     SizedBox(height: 20.v),
//                                     _buildWidget(context),
//                                     SizedBox(height: 7.v),
//                                     Padding(
//                                         padding: EdgeInsets.only(
//                                             left: 2.h, right: 66.h),
//                                         child: Row(children: [
//                                           Container(
//                                               width: 121.h,
//                                               margin: EdgeInsets.only(top: 1.v),
//                                               child: RichText(
//                                                   text: TextSpan(children: [
//                                                     TextSpan(
//                                                         text: "jeans jacket\n",
//                                                         style: theme.textTheme
//                                                             .titleSmall),
//                                                     TextSpan(
//                                                         text: "AED500",
//                                                         style: CustomTextStyles
//                                                             .bodySmallIBMPlexSansffc5c5c512)
//                                                   ]),
//                                                   textAlign: TextAlign.left)),
//                                           Container(
//                                               width: 121.h,
//                                               margin:
//                                                   EdgeInsets.only(left: 86.h),
//                                               child: RichText(
//                                                   text: TextSpan(children: [
//                                                     TextSpan(
//                                                         text:
//                                                             "Classics Shirt  \n",
//                                                         style: theme.textTheme
//                                                             .titleSmall),
//                                                     TextSpan(
//                                                         text: "AED500",
//                                                         style: CustomTextStyles
//                                                             .bodySmallIBMPlexSansffc5c5c512)
//                                                   ]),
//                                                   textAlign: TextAlign.left))
//                                         ]))
//                                   ]))))
//                 ]))));
//   }

//   /// Section Widget
//   Widget _buildNine(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(vertical: 38.v),
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: fs.Svg(ImageConstant.imgGroup20), fit: BoxFit.cover)),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           SizedBox(height: 3.v),
//           CustomAppBar(
//               leadingWidth: 29.h,
//               leading: AppbarLeadingImage(
//                   imagePath: ImageConstant.imgArrowLeftPrimary,
//                   margin: EdgeInsets.only(left: 20.h, top: 3.v),
//                   onTap: () {
//                     onTapArrowLeft(context);
//                   }),
//               centerTitle: true,
//               title: AppbarSubtitle(text: "Cart"))
//         ]));
//   }

//   /// Section Widget
//   Widget _buildFiftyOne(BuildContext context) {
//     return Align(
//         alignment: Alignment.center,
//         child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.h),
//             child: ListView.separated(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 separatorBuilder: (context, index) {
//                   return SizedBox(height: 22.v);
//                 },
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return FiftyoneItemWidget();
//                 })));
//   }

//   /// Section Widget
//   Widget _buildWidget(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.only(left: 2.h),
//         child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Expanded(
//               child: CustomImageView(
//                   imagePath: ImageConstant.imgRectangle19868,
//                   height: 233.v,
//                   width: 187.h,
//                   radius: BorderRadius.circular(12.h),
//                   margin: EdgeInsets.only(right: 10.h))),
//           Expanded(
//               child: CustomImageView(
//                   imagePath: ImageConstant.imgRectangle19869,
//                   height: 231.v,
//                   width: 187.h,
//                   radius: BorderRadius.circular(12.h),
//                   margin: EdgeInsets.only(left: 10.h)))
//         ]));
//   }

//   /// Common widget
//   Widget _buildShipping(
//     BuildContext context, {
//     required String shipping,
//     required String free,
//   }) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       Text(shipping,
//           style: CustomTextStyles.bodyMedium13
//               .copyWith(color: theme.colorScheme.primary)),
//       Text(free,
//           style: CustomTextStyles.bodyMedium13
//               .copyWith(color: theme.colorScheme.primary))
//     ]);
//   }

//   /// Navigates back to the previous screen.
//   onTapArrowLeft(BuildContext context) {
//     Navigator.pop(context);
//   }
// }
