import 'package:flutter/material.dart';
import 'package:hawkers/Provider/user.dart';
import 'package:hawkers/Screens/HomeScreen.dart';
import 'package:hawkers/Screens/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


String mFirstName;
String mLastName;
String mEmailID;
String mAccessToken;

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextScreen();
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((SharedPreferences sharedPreferences) {
      mFirstName = sharedPreferences.getString("user_first_name");
      mLastName = sharedPreferences.getString("user_last_name");
      mEmailID = sharedPreferences.getString("user_email");
      mAccessToken = sharedPreferences.getString("user_access_token");
    })
        .whenComplete(() {
      print("Complete!");
    })
        .catchError((error){
      print("Error: ${error.toString()}");
    });
    super.initState();
  }

  nextScreen() async {
    if (await Provider.of<User>(context, listen: false).tryAutoLogin(context)) {
      Future.delayed(Duration.zero, () {
        // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, Login.routeName);
        // Navigator.pushReplacementNamed(context, '/HomeScreen');
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
