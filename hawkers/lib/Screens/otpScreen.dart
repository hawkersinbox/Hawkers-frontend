import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Screens/HomeScreen.dart';
import 'package:hawkers/Screens/userRequest.dart';
import'package:provider/provider.dart';
import 'package:hawkers/Utility/userData.dart';
import 'package:hawkers/Provider/user.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:hawkers/Models/userModel.dart' as UserModel;
import 'package:hawkers/Provider/user.dart';
import 'package:hawkers/Services/api.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '';

class Otp extends StatefulWidget {
  static const routeName = '/Otp';

 // final UserModel. otpResponse;
  final mobile;
  final isLogin;

  const Otp({Key key, this.mobile, this.isLogin}) : super(key: key);
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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

  requestOtp() async {
    String body = widget.isLogin
        .json.encode({'mobile': widget.mobile});

    try {
      widget.isLogin;
           await restApi.getOtp(body);
    } catch (e) {}

    startTimer(70);
  }
  verifyOtp() async {
    otp = _pinPutController.text;
    if (otp.isNotEmpty && otp.length == 6) {
      String body = widget.isLogin
          . json.encode({'mobile': widget.mobile, 'otp': otp});


      setState(() {
        _isLoading = true;
      });

      final response = await restApi.getOtp(body);
      final responseData = jsonDecode(response.body);

      if (responseData["success"] == true) {
        UserModel.User loginResponse = UserModel.userFromJson(response.body);
        UserData.user = loginResponse;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('userData', json.encode(UserData.user.toJson()));

        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft, child: HomeScreen()),
            ModalRoute.withName('/'));

        setState(() {
          _isLoading = false;
        });
      } else {
      //  Global.showErrorDialog(context, "", responseData["message"]);
      }
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,

          ),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(

                children: <Widget>[
                Text('Verify Mobile Number',
                style:TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color:Colors.black,
                )),
              //    Divider(height: 20,color:Colors.black,thickness: 2,),

                  Container(
                    color: Colors.white,
                    width: 300,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: PinPut(
                      fieldsCount: 4,
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
                    height: ScreenUtil().setHeight(60),
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
                    height: ScreenUtil().setHeight(60),
                  ),
          Container(
            child: SizedBox(
              height:45,
              width:ScreenUtil().setWidth(400),
              child: RaisedButton(
                onPressed: (){
                  _OtpState();

                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((3)) ),
                color:Colors.lightGreen,

                      child: _isLoading
                          ? SpinKitCircle(
                        color: Colors.white,
                        size: 25,
                      )
                          : Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(42),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          )
                ],
              ),
            ],
          ),
        ),
    );
  }
}