import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Gift_Erbil/screens/order_confirmation_screen.dart';
import 'package:Gift_Erbil/theme/style_guide.dart';
import 'package:Gift_Erbil/widgets/cart_item_widget.dart';
import 'package:Gift_Erbil/models/cart_items.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  static const routeName = '/cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
//   DateTime _pickedDate = DateTime.now();
//   TimeOfDay time = TimeOfDay.now();
//
//   ////--------------------------------------------------------------initialization
//
// //-------------------------------------------------picking a date
//   _pickDate() async {
//     DateTime date = await showDatePicker(
//       context: context,
//       firstDate: DateTime(DateTime.now().year),
//       lastDate: DateTime(DateTime.now().year + 5),
//       initialDate: _pickedDate,
//     );
//     if (date != null)
//       setState(() {
//         _pickedDate = date;
//       });
//   }
//
// //-------------------------------------------------picking a time
//   _pickedTime() async {
//     TimeOfDay t = await showTimePicker(context: context, initialTime: time);
//     if (t != null)
//       setState(() {
//         time = t;
//       });
//   }

  ////-------------------------------------------------------------build widget
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    final cartData = Provider.of<Cart>(context);
    final cartTotal = cartData.cartTotal.toString();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Shopping Cart'),
        backgroundColor: AppTheme.PrimaryColor,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          if (cartData.items.isNotEmpty)
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartData.itemCount,
              itemBuilder: (context, index) => CartItemWidget(
                id: cartData.items.values.toList()[index].id,
                title: cartData.items.values.toList()[index].title,
                description: cartData.items.values.toList()[index].description,
                color: cartData.items.values.toList()[index].color,
                imageUrl: cartData.items.values.toList()[index].imageUrl,
                price: cartData.items.values.toList()[index].price,
                quantity: cartData.items.values.toList()[index].quantity,
              ),
            ),
          if (cartData.items.isEmpty)
            Container(
              height: _screenHeight * 0.70,
              child: Card(
                elevation: 3,
                child: Center(
                  child: Wrap(
                    children: [
                      Text(
                        'Your Cart is Empty  ',
                        style: TextStyle(
                            fontSize: 20, color: AppTheme.ColorSwatch),
                      ),
                      Icon(Icons.shopping_cart_outlined,
                          color: AppTheme.ColorSwatch)
                    ],
                  ),
                ),
              ),
            ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Text(
                'Your Total: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  cartTotal,
                  style: TextStyle(
                    color: AppTheme.PrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsets.only(left: 75, right: 75, bottom: 15),
            child: RaisedButton(
              color: AppTheme.PrimaryColor,
              onPressed: ()=> {
                if(cartData.items.isNotEmpty) {
                  Navigator.of(context).push(_createRoute())
                }else {
                  _showSnack(context,_scaffoldKey)
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text('NEXT',
                        style: TextStyle(color: Colors.white, fontSize: 21)),
                  ),
                   Icon(Icons.arrow_forward_rounded,size: 15,color: Colors.white,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showSnack(BuildContext context,GlobalKey<ScaffoldState>_scaffoldkey){
    final snackBar = SnackBar(content: Text('Your cart is empty'));
    _scaffoldkey.currentState.showSnackBar(snackBar);
}
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          OrderConfirmationScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // print('inside create route ');
        var begin = Offset(1.0, 0.5);
        var end = Offset.zero;
        var curve = Curves.easeOutQuart;

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
