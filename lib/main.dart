import 'package:Gift_Erbil/admin/admin_login_medium.dart';
import 'package:Gift_Erbil/admin/admin_screen.dart';
import 'package:Gift_Erbil/screens/your_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:Gift_Erbil/models/cart_items.dart';
import 'package:Gift_Erbil/models/products_Data.dart';
import 'package:Gift_Erbil/screens/profile.dart';
import 'package:Gift_Erbil/screens/product_detail_Screen.dart';
import 'package:Gift_Erbil/screens/home_screen.dart';
import 'package:Gift_Erbil/screens/auth_screen.dart';
import 'package:Gift_Erbil/screens/cart_screen.dart';
import 'package:Gift_Erbil/screens/login_screen.dart';
import 'package:Gift_Erbil/screens/order_confirmation_screen.dart';
import 'admin/admin_screen.dart';
import 'theme/style_guide.dart';


// test comment for sake of github commit :)

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppTheme.PrimaryColor, // navigation bar color
    statusBarColor: AppTheme.PrimaryColor, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => ProductsData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gift Erbil',
      theme: ThemeData(
        fontFamily: 'WorkSans',
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return SafeArea(child: HomeScreen());
            }
            return LoginScreen();
          }),

      routes: {
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        CartScreen.routeName: (context) => CartScreen(),
        Profile.routeName: (context) => Profile(),
      },
    );
  }
}

//--------------------------------the new version of implementing firebase----------------------

// import 'package:Gift_Erbil/screens/auth_screen.dart';
// import 'package:flutter/material.dart';

// // Import the firebase_core plugin
// import 'package:firebase_core/firebase_core.dart';

// void main()async {

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // Create the initilization Future outside of `build`:
//   // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder (
//       // Initialize FlutterFire:
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {

//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return AuthScreen();
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }
