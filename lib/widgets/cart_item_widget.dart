import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';


import 'package:Gift_Erbil/models/cart_items.dart';
import 'package:Gift_Erbil/theme/style_guide.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String color;
  final String imageUrl;
  final double price;
  final int quantity;

  const CartItemWidget(
      {Key key, this.id, this.title,this.description, this.color, this.imageUrl, this.price, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Container(
        child: Dismissible(
          key: Key(id),
          background: Container(
              margin: EdgeInsets.all(3),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 7),
              color: Colors.red),
          onDismissed: (direction) {
            Provider.of<Cart>(context, listen: false).removeItem(id);

            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("$title dismissed")));
          },
          direction: DismissDirection.endToStart,
          child: Card(
            elevation: 3,
            color: Colors.white,
            child:
            //---------------------------------------old design
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(imageUrl),
              ),
              title: Text(title,style: TextStyle(fontSize:13,),),
              trailing: Wrap(
                alignment: WrapAlignment.center,
                // space between two icons
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text('$price',style: TextStyle(fontSize:13,))),
                  if(quantity>1)
                    IconButton(
                    icon: Icon(
                      Icons.exposure_minus_1,
                      size: 20,
                    ),
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false).decreaseItem(id);

                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("$title dismissed")));
                    },
                  ), // icon-1
                  Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text('  X $quantity',style: TextStyle(color: AppTheme.PrimaryColor),)),
                  IconButton(
                    icon: Icon(Icons.plus_one,size: 20,),
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false).increaseItem(id);

                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("$title added")));
                    },
                  ),
                ],
              ),

              //
            ),
          ),
        ),
    );
  }
}
