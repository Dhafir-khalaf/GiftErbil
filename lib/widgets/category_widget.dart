import 'package:flutter/material.dart';
import 'package:Gift_Erbil/models/category.dart';
import 'package:Gift_Erbil/screens/category_detail_screen.dart';

import '../theme/style_guide.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  final PageController pageController;
  final currentPage;

  const CategoryWidget(
      {Key key, this.category, this.pageController, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 450),
              pageBuilder: (context, _, __) =>
                  CategoryDetailScreen(category: category),
            ),
          );

        },
        child: AnimatedBuilder(
          animation: pageController,
          builder: (BuildContext context, Widget child) {
            double value = 1;
            if (pageController.position.haveDimensions) {
              value = pageController.page - currentPage;
              value = (1 - value.abs() * 0.5).clamp(0.0, 1.0);
            }
            return Stack(
              children: [
                if(currentPage==0)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin:  EdgeInsets.only(left: screenWidth *0.4,bottom: screenHeight*0.1),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 5, top: 25),
                            width: 75,
                            height: 40,
                            child: Image.asset(
                                'assets/images/icons/triple_arrow_right.png')),
                        Container(
                            margin: const EdgeInsets.only(right: 1, top: 25),
                            child: Text('Swipe to the left')),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ClipPath(
                    clipper: CharacterCardBackgroundClipper(),
                    child: Hero(
                      tag: 'background-${category.name}',
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        width: screenWidth * 0.9,
                        height: 0.55 * screenHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          gradient: LinearGradient(
                            colors: category.colors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: Hero(
                      tag: 'image-${category.name}',
                      child: Image.asset(
                        category.imagePath,
                        height: screenHeight * 0.45 * value,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    top: 85,
                    bottom: 15,
                  ),
                  child: Hero(
                    tag: 'text-${category.name}',
                    child: Material(
                      color: Colors.transparent,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: category.name, style: AppTheme.heading),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  // Path getClip(Size size) {
  //   Path clippedPath = Path();
  //   double curveDistance = 40;
  //
  //   clippedPath.moveTo(0, size.height * 0.4);
  //   clippedPath.lineTo(0, size.height - curveDistance);
  //   clippedPath.quadraticBezierTo(
  //       1, size.height - 1, 0 + curveDistance, size.height);
  //   clippedPath.lineTo(size.width - curveDistance, size.height);
  //   clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
  //       size.height - curveDistance);
  //   clippedPath.lineTo(size.width, 0 + curveDistance);
  //   clippedPath.quadraticBezierTo(size.width - 1, 0,
  //       size.width - curveDistance - 5, 0 + curveDistance / 3);
  //   clippedPath.lineTo(curveDistance, size.height * 0.29);
  //   clippedPath.quadraticBezierTo(
  //       1, (size.height * 0.30) + 10, 0, size.height * 0.4);
  //   return clippedPath;
  // }

  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(55, size.height / 1.4);
    var firstEndPoint = Offset(size.width / 1.7, size.height / 1.3);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width - (15), size.height - 55);
    var secondEndPoint = Offset(size.width, size.height / 2.4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
