import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Gift_Erbil/theme/style_guide.dart';
import 'dart:io';
import 'package:Gift_Erbil/models/products_Data.dart';

class OrderDetailScreen extends StatefulWidget {
  final String itemId;
  final String itemTitle;
  final String itemImageUrl;
  final String itemQuantity;
  final String itemPrice;
  final String description;
  final String deliveryAddress;
  final String deliveryDate;
  final String deliveryTime;
  final String userName;
  final String userPhone;

  OrderDetailScreen({
    this.itemId,
    this.itemTitle,
    this.itemImageUrl,
    this.itemQuantity,
    this.itemPrice,
    this.description,
    this.deliveryAddress,
    this.deliveryDate,
    this.deliveryTime,
    this.userName,
    this.userPhone,
  });

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

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
                widget.itemImageUrl,
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
                        widget.itemTitle,
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
                        "${widget.description}",
                        style: AppTheme.description,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: Text(
                        "${widget.itemPrice.toString()}" + ' ID',
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(15),
                    //   child: Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: IconButton(
                    //       icon: Icon(
                    //         Icons.add_shopping_cart,
                    //         size: 35,
                    //         color: AppTheme.PrimaryColor,
                    //       ),
                    //       onPressed: () {
                    //         cartData.addItem(id, title, imageUrl, price);
                    //         notifyAdded(context, title);
                    //       },
                    //     ),
                    //   ),
                    // ),
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
