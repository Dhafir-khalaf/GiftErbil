import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';

import 'package:Gift_Erbil/models/cart_items.dart';
import '../theme/style_guide.dart';


class ProductDetailScreen extends StatelessWidget {
  static const routeName = 'product-detail-screen';
  final id;
  final title;
  final description;
  final imageUrl;
  final price;
  final color;

  const ProductDetailScreen(
      {Key key,
      this.id,
      this.title,
      this.description,
      this.color,
      this.imageUrl,
      this.price,})
      : super(key: key);
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
    // final currencyFormatter2 = NumberFormat.currency(locale: 'ID');

    final currencyFormatter = NumberFormat('#,##0', 'ID');

    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(
              color: AppTheme.PrimaryColor,
            ),
            expandedHeight: sh * 0.4,
            elevation: 3,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: Card(
                margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                elevation: 3,
                color: AppTheme.SeconderyColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.all(15),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: Text(
                        description,
                        style: AppTheme.description,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: Text(
                        currencyFormatter.format(price) + ' ID',
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
