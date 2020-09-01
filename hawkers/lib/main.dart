import 'package:flutter/material.dart';
import 'package:hawkers/Provider/community.dart';
import 'package:hawkers/Provider/getCommunity.dart';
import 'package:hawkers/Provider/getProduct.dart';
import 'package:hawkers/Screens/HomeScreen.dart';
import 'package:hawkers/Screens/LoginScreen.dart';
import 'package:hawkers/Screens/addCommunity.dart';
import 'package:hawkers/Screens/addProducts.dart';
import 'package:hawkers/Screens/communities.dart';
import 'package:hawkers/Screens/products.dart';
import 'package:hawkers/Screens/productsReview.dart';
import 'package:hawkers/Screens/registrationScreen.dart';
import 'package:hawkers/Screens/otpScreen.dart';
import 'package:hawkers/Screens/userRequest.dart';
import 'package:hawkers/Provider/user.dart';
import 'package:provider/provider.dart';


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
        ChangeNotifierProvider<GetCommunity>(
          create: (_) => GetCommunity(),
        ),
        ChangeNotifierProvider<GetProduct>(
          create: (_) => GetProduct(),
        ),
        ChangeNotifierProvider<Community>(
          create: (_) => Community(),
        ),
      ],
    child: MaterialApp(
      title: 'Hawkers',
      theme: ThemeData(

        primarySwatch: Colors.green,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductReview(),
      routes: {
        Otp.routeName: (ctx) => Otp(),
        Login.routeName: (ctx) => Login(),
        Registration.routeName: (ctx) => Registration(),
        Communities.routeName: (ctx) => Communities(),
        Registration.routeName: (ctx) => HomeScreen(),
        ProductList.routeName: (ctx) => ProductList(),
        AddProducts.routeName: (ctx) => AddProducts(),
        AddCommunity.routeName: (ctx) => AddCommunity(),


      },
    )
    );
  }
}