import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hawkers/Models/userModel.dart';
import 'package:hawkers/Provider/MobileNumber.dart';
import 'package:hawkers/Screens/registrationScreen.dart';
import 'package:hawkers/Utility/userData.dart';
import 'package:hawkers/utils/SizeConfig.dart';
import 'package:provider/provider.dart';
import 'package:hawkers/Provider/user.dart';
import 'package:hawkers/Screens/otpScreen.dart';
import 'package:hawkers/Services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  RestApi restApi = RestApi();
  TextEditingController _mobileController = new TextEditingController();
  String _mobile;
  bool mobileValid = true;
  bool _isLoading = false;

  _login() async {
    if (_mobile.isEmpty || _mobile.length < 10) {
      setState(() {
        mobileValid = false;
      });
    } else {
      String body = json.encode({"mobile": _mobile});
      setState(() {
        _isLoading = true;
      });
      var responseData;
      try {
        final response = await restApi.login(body);
        responseData = jsonDecode(response.body);
      } catch (e) {}

      if (responseData["success"]) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otp(
                    mobile: _mobile,
                  )),
        );
      } else {
        final snackBar = SnackBar(content: Text('${responseData["message"]}'));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var mobileNumberDetails = Provider.of<MobileNumberProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: 0,
        title: Text(
          'My Account',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Mobile',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(0),
                height: 45,
                decoration: BoxDecoration(
                    color:Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.black)),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        textAlign: TextAlign.start,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black, fontSize: 21),
                        //     color:Colors.grey,

                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        onChanged: (val) {
                          _mobile = val;
                          mobileNumberDetails.setMobileNumber(_mobile);
                          if (!mobileValid) {
                            setState(() {
                              mobileValid = true;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                mobileValid ? '' : 'Enter valid Phone Number',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Important Tip:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'The Hawkers is...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  child: SizedBox(
                    height: 45,

                     width:MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _login();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((3))),
                      color: Colors.lightGreen,
                      child: _isLoading
                          ? SpinKitCircle(
                              color: Colors.white,
                              size: 25,
                            )
                          : Text(
                              'Request Otp',
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.of(context).pushNamed(Registration.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    InkWell(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.of(context).pushNamed(Registration.routeName);
                      },
                      child: Text(
                        'Create one',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
