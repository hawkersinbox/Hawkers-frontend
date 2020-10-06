import 'package:flutter/material.dart';
import 'package:hawkers/Provider/user.dart';
import 'package:hawkers/Screens/HomeScreen.dart';
import 'package:hawkers/Screens/loginScreen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  nextScreen() async {
    if (await Provider.of<User>(context, listen: false).tryAutoLogin(context)) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, Login.routeName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
