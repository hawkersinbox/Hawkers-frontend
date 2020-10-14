import 'dart:async';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hawkers/Provider/AccessToken.dart';
import 'package:hawkers/Provider/MobileNumber.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Screens/HomeScreen.dart';
import 'package:hawkers/Utility/userData.dart';
import 'package:hawkers/Models/userModel.dart' as UserModel;
import 'package:hawkers/Services/api.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


String verification_code_text = "Enter 6 digits verification code sent to ";

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


  var accessTokenProvider;


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

    print("Request OTP Mobile: ${widget.mobile.toString()}");
    String body = json.encode({'mobile': widget.mobile});

    print("Request OTP Body: ${body.toString()}");

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
        if (responseData["response"]["status"] != null){
          if (responseData["response"]["status"].toString() == "ACTIVE"){
            if (response.body != null){
              print("Response Not Null!");
              print("Response Body: ${response.body}");
              UserModel.User loginResponse = UserModel.userFromJson(response.body);
              UserData.user = loginResponse;
              final prefs = await SharedPreferences.getInstance();
              prefs.setString(
                'userData',
                json.encode(
                  UserData.user.toJson(),
                ),
              );

              prefs.setString("user_first_name", responseData["response"]["user"]["firstName"]);
              prefs.setString("user_last_name", responseData["response"]["user"]["lastName"]);
              prefs.setString("user_email", responseData["response"]["user"]["email"]);
              prefs.setString("user_access_token", responseData["response"]["user"]["accessToken"]);

              String accessToken = responseData["response"]["user"]["accessToken"].toString();
              print("Access Token: $accessToken");
              prefs.setString("access_token", accessToken);

              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: HomeScreen()),
                  ModalRoute.withName('/'));

              setState(() {
                _isLoading = false;
              });
            }else if (response.body == null){
              String message = "Login request sent for approval, will be notified once approved!";
              print("Response Null!");
              print("Response Body: ${response.body}");
              showDialog(
                  context: context,
                  builder: (context) => showPopupMessageDialog(context, message, 'Waiting Approval')
              );
            }
          }else if (responseData["response"]["status"].toString() == "DELETE"){
            String message = responseData["message"].toString();
            showDialog(
                context: context,
                builder: (context) => showPopupMessageDialog(context, message, "Account Deleted!")
            );
            print("User Deleted!");
          }else if (responseData["response"]["status"].toString() == "DRAFT"){
            String message = responseData["message"].toString();
            showDialog(
                context: context,
                builder: (context) => showPopupMessageDialog(context, message, "In Draft")
            );
            print("User Draft!");
          }
        }else {
          print("Staus Null!");
        }
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
    accessTokenProvider = Provider.of<AccessTokenProvider>(context);
    var mobileNumberDetails = Provider.of<MobileNumberProvider>(context);
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
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: 320,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        verification_code_text,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        mobileNumberDetails.mobileNumber,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: 320,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
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
                height: 5,
              ),
              Container(
                width: 320,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Change Number',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.lightGreen,
                        ),
                      )
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
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: SizedBox(
                  height: 45,
                  width: 320,
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

  Widget showPopupMessageDialog(BuildContext context, String message, String title) {
    return Center(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          width: 250,
          height: 250,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  message,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.lightGreen,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Okay',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
