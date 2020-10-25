import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hawkers/Provider/MobileNumber.dart';
import 'package:hawkers/Screens/registrationScreen.dart';
import 'package:hawkers/Utility/SizeConfig.dart';
import 'package:hawkers/Utility/colors.dart';
import 'package:hawkers/Widgets/custumButton.dart';
import 'package:provider/provider.dart';
import 'package:hawkers/Screens/otpScreen.dart';
import 'package:hawkers/Services/api.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  RestApi restApi = RestApi();
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
        if (responseData["success"]) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Otp(
                      mobile: _mobile,
                    )),
          );
        } else {
          final snackBar =
              SnackBar(content: Text('${responseData["message"]}'));
          _scaffoldKey.currentState.showSnackBar(snackBar);
        }
      } catch (e) {
        final snackBar = SnackBar(content: Text('Network error'));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        print(e);
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
                    color: hawkersLightGrey,
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
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 1),
                          prefixText: '+91 ',
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
                child: CustumButton(
                  isLoading: _isLoading,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _login();
                  },
                  title: 'Request OTP',
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
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 17,
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
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
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
