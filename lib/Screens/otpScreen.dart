import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Screens/HomeScreen.dart';
import 'package:hawkers/Utility/userData.dart';
import 'package:hawkers/Models/userModel.dart' as UserModel;
import 'package:hawkers/Services/api.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otp extends StatefulWidget {
  static const routeName = '/Otp';

  final mobile;
  const Otp({
    Key key,
    this.mobile,
  }) : super(key: key);
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  RestApi restApi = RestApi();
  bool _isLoading = false;
  String otp = '';

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15),
    );
  }

  Timer _timer;
  int _start = 10;

  void startTimer(int startNumber) {
    const oneSec = const Duration(seconds: 1);
    _start = startNumber;
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    startTimer(60);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  requestOtp() async {
    String body = json.encode({'mobile': widget.mobile});

    try {
      await restApi.login(body);
    } catch (e) {}

    startTimer(70);
  }

  verifyOtp() async {
    otp = _pinPutController.text;
    if (otp.isNotEmpty && otp.length == 6) {
      String body = json.encode({'mobile': widget.mobile, 'otp': otp});

      setState(() {
        _isLoading = true;
      });

      final response = await restApi.otpVerify(body);
      final responseData = jsonDecode(response.body);
      print(responseData);
      if (responseData["success"]) {
        UserModel.User loginResponse = UserModel.userFromJson(response.body);
        UserData.user = loginResponse;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(
          'userData',
          json.encode(
            UserData.user.toJson(),
          ),
        );

        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft, child: HomeScreen()),
            ModalRoute.withName('/'));

        setState(() {
          _isLoading = false;
        });
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
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Verify Mobile Number',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Container(
                color: Colors.white,
                width: 300,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: PinPut(
                  fieldsCount: 6,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20)),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _start > 0
                  ? Text(
                      'Resend in ${_start.toString()}',
                      style: TextStyle(color: Colors.lightGreen),
                    )
                  : InkWell(
                      onTap: () {
                        requestOtp();
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.lightGreen,
                            decoration: TextDecoration.underline),
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: SizedBox(
                  height: 45,
                  width: 200,
                  child: RaisedButton(
                    onPressed: () {
                      verifyOtp();
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
                            'Verify',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
