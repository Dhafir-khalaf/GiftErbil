import 'package:Gift_Erbil/theme/style_guide.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/shop_drawer.dart';

import 'package:Gift_Erbil/widgets/badge_home.dart';
import 'package:Gift_Erbil/models/cart_items.dart';
import 'package:Gift_Erbil/screens/cart_screen.dart';
import 'category_screen_listing.dart';
import 'package:Gift_Erbil/widgets/shop_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool drawerIsClosed = true;

  //bool _canBeDragged;
  //double minDragStartEdge = 10;
  //double maxDragStartEdge =100.0;
  final maxSlide = 200.0;
  final appDrawer = Container(
    color: Colors.lightBlueAccent,
  );

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void toggle() {
    if (_animationController.isDismissed) {
      _animationController.forward();
      drawerIsClosed = false;
    } else {
      _animationController.reverse();
      drawerIsClosed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Container(
        width: _width,
        height: _height,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            double slide = maxSlide * _animationController.value;
            double scale = 1 - (_animationController.value * 0.3);
            return Stack(
              children: [
                ShopDrawer(),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerRight,
                  child: drawerIsClosed
                      ? mainWidget(context, drawerIsClosed)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: mainWidget(context, drawerIsClosed),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    ));
  }

  Widget mainWidget(BuildContext context, bool drawerbool) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: drawerIsClosed ? AppTheme.PrimaryColor: Colors.black26,
            leading: Container(
              margin: const EdgeInsets.only(left: 15, top: 13),
              child: IconButton(
                alignment: Alignment.centerLeft,
                icon: drawerbool
                    ? Icon(
                        Icons.menu,
                        size: 35,
                      )
                    : Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                      ),
                tooltip: 'Open profile',
                onPressed: toggle,
              ),
            ),
            expandedHeight: 80,
            floating: true,
            pinned: false,
            snap: false,
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.asset('assets/images/LogoGiftErbil.png'),
            // ),
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  right: 15,
                  top: 15,
                ),
                child: Consumer<Cart>(
                  builder: (_, cart, c) => BadgeHome(
                    child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 27,
                        ),
                        onPressed: () => Navigator.pushNamed(context, CartScreen.routeName)),
                    value: cart.itemCount.toString(),
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SliverFillRemaining(
            fillOverscroll: false,
            hasScrollBody: false,
            child: CategoryScreenListing(),
          ),
        ],
      ),
    );
  }
}
