import 'package:Gift_Erbil/theme/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:Gift_Erbil/widgets/category_widget.dart';
import '../models/category.dart';

class CategoryScreenListing extends StatefulWidget {
  CategoryScreenListing({Key key}) : super(key: key);

  @override
  _CategoryScreenListingState createState() => _CategoryScreenListingState();
}

class _CategoryScreenListingState extends State<CategoryScreenListing> {
  PageController _pageController;
  int currentPage = 0;
  var pageNum;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 33, top: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Gift', style: AppTheme.display1),
                        TextSpan(text: '\n'),
                        TextSpan(text: ' Erbil', style: AppTheme.display2)
                      ],
                    ),
                  ),
                  // if(_pageController.page == 0)
                  // Row(
                  //   children: [
                  //     Container(
                  //         margin: const EdgeInsets.only(right: 25, top: 25),
                  //         child: Text('Swipe to the right')),
                  //     Container(
                  //         margin: const EdgeInsets.only(right: 25, top: 25),
                  //         width: 75,
                  //         height: 40,
                  //         child: Image.asset(
                  //             'assets/images/icons/right_arrow.png'))
                  //   ],
                  // ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 11.0),
              child: PageView(
                controller: _pageController,
                children: [
                  for (var index = 0; index < categories.length; index++)
                    CategoryWidget(
                        category: categories[index],
                        pageController: _pageController,
                        currentPage: index),

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
