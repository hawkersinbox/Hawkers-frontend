import 'package:flutter/material.dart';
import 'package:hawkers/Provider/SalesRequestProvider.dart';
import 'package:hawkers/Provider/community.dart';
import 'package:hawkers/Provider/getProduct.dart';
import 'package:hawkers/Screens/HomeScreen.dart';
import 'package:hawkers/Screens/adminApproval/adminApproval.dart';
import 'package:hawkers/Screens/community/addCommunity.dart';
import 'package:hawkers/Screens/logout.dart';
import 'package:hawkers/Screens/product/addProducts.dart';
import 'package:hawkers/Screens/community/communities.dart';
import 'package:hawkers/Screens/product/productReview.dart';
import 'package:hawkers/Screens/product/products.dart';
import 'package:hawkers/Screens/profile.dart';
import 'package:hawkers/Screens/registrationScreen.dart';
import 'package:hawkers/Screens/otpScreen.dart';
import 'package:hawkers/Screens/salesRequest/salesRequest.dart';
import 'package:hawkers/Screens/splashScreen.dart';
import 'package:hawkers/Provider/user.dart';
import 'package:hawkers/Screens/help.dart';
import 'package:hawkers/Screens/updateProfile.dart';
import 'package:provider/provider.dart';

import 'Screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<User>(
          create: (_) => User(),
        ),
        ChangeNotifierProvider<CommunityProvider>(
          create: (_) => CommunityProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider<SalesRequestProvider>(
          create: (_) => SalesRequestProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Hawkers',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:AdminApproval(),
        routes: {
          // CreateSalesRequest.routeName: (ctx) => CreateSalesRequest(),
          SplashScreen.routeName: (ctx) => SplashScreen(),
          SalesRequest.routeName: (ctx) => SalesRequest(),
          Otp.routeName: (ctx) => Otp(),
          Login.routeName: (ctx) => Login(),
          Registration.routeName: (ctx) => Registration(),
          Communities.routeName: (ctx) => Communities(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          ProductList.routeName: (ctx) => ProductList(),
          AddProducts.routeName: (ctx) => AddProducts(),
          AddCommunity.routeName: (ctx) => AddCommunity(),
        },
      ),
    );
  }
}
