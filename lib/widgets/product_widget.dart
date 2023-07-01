import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flushbar/flushbar.dart';

import 'package:Gift_Erbil/theme/style_guide.dart';
import 'package:Gift_Erbil/models/cart_items.dart';
import 'package:Gift_Erbil/screens/product_detail_Screen.dart';

class ProductWidget extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String color;
  final double price;
  final imageUrl;

  final isFavorite;

  ProductWidget(
      {this.id,
      this.title,
      this.description,
        this.color,
      this.price,
      this.imageUrl,
      this.isFavorite});
  void notifyAdded(BuildContext context, String title){
    Flushbar(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      duration: Duration(seconds: 2),
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      message: '$title has been added to cart!',
    )..show(context);
  }
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    final cartData = Provider.of<Cart>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // print('this the price ' + price.toString());
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute());
      },
      child: Card(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        elevation: 5,
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 65,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 15, bottom: 5, left: 15, right: 15),
                // width: screenWidth * 0.90,
                // height: screenHeight * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 35,
              child: Card(
                elevation: 0,
                child: ListTile(
                  title: Text(title, style: AppTheme.display2),
                  subtitle: Text(
                    description,
                    style: AppTheme.description,
                    textAlign: TextAlign.justify,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    children: [
                      Flexible(
                          flex: 4,
                          child: Text(
                              'Price ${currencyFormatter.format(price).padRight(2)} IQD')),
                      Flexible(
                        flex: 6,
                        child: IconButton(
                              icon: Icon(
                                Icons.add_shopping_cart,
                                size: 35,
                                color: AppTheme.PrimaryColor,
                              ),
                              onPressed: () {
                                cartData.addItem(id,title,description,color, imageUrl, price);
                                notifyAdded(context, title);
                              }),
                        ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ProductDetailScreen(
        id: id,
        title: title,
        description: description,
        color: color,
        price: price,
        imageUrl: imageUrl,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // print('inside create route ');
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
