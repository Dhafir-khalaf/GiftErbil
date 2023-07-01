import 'package:Gift_Erbil/models/cart_items.dart';
import 'package:Gift_Erbil/screens/cart_screen.dart';
import 'package:Gift_Erbil/widgets/badge_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'package:Gift_Erbil/models/product.dart';
import 'package:Gift_Erbil/widgets/product_widget.dart';
import 'package:Gift_Erbil/models/category.dart';
import '../theme/style_guide.dart';
import 'package:Gift_Erbil/models/products_Data.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Category category;

  const CategoryDetailScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: widget.category.colors,
                ),
              ),
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    iconSize: 39,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  expandedHeight: 65.0,
                  floating: true,
                  pinned: false,
                  snap: false,
                  backgroundColor: AppTheme.PrimaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      widget.category.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  actions: [
                    Container(
                margin: const EdgeInsets.only(right:15,top:15,),
                child:Consumer<Cart>(builder: (_,cart,ch)=>BadgeHome(
                  child:ch,
                  value: cart.itemCount.toString(),
                  color:Colors.red
                ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart,size: 27,),
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                ),       
              ), 
                
                
              ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: 'image-${widget.category.name}',
                      child: Image.asset(
                        widget.category.imagePath,
                        height: screenHeight * 0.45,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Hero(
                    tag: 'text-${widget.category.name}',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: Material(
                          color: Colors.transparent,
                          child: Text(widget.category.name,
                              style: AppTheme.heading)),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  sliver: SliverToBoxAdapter(
                    child: Text(widget.category.description,
                        style: AppTheme.subHeading),
                  ),
                ),
                productsGridView(widget.category.name),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget productsGridView(String category) {
    // print(category);
    String colorsList;
    var fetchedProducts;
    if (category == 'Cakes') {
      fetchedProducts = Provider.of<ProductsData>(context).getCakeProducts();
    } else if (category == 'Flowers') {
      fetchedProducts = Provider.of<ProductsData>(context).getFlowerProducts();
    } else if (category == 'Boxes') {
      fetchedProducts = Provider.of<ProductsData>(context).getBoxProducts();
    }
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if(category == 'Flowers'){
             colorsList = fetchedProducts[index].colors.join("");
          }
          return ProductWidget(
            id: fetchedProducts[index].id,
            title: fetchedProducts[index].title,
            description: fetchedProducts[index].description,
            color: colorsList,
            imageUrl: fetchedProducts[index].imageUrl,
            price: fetchedProducts[index].price,
            isFavorite: fetchedProducts[index].isFavorite,
          );
        },
        childCount: fetchedProducts.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        /////////////////show how the grid should be laid on the screen ////////////
        crossAxisCount: 1,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 14 / 16,
      ),
    );
  }
}
