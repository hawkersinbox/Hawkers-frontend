import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hawkers/Screens/registrationScreen.dart';
import'package:provider/provider.dart';
import 'package:hawkers/Utility/userData.dart';
import 'package:hawkers/Provider/user.dart';
import 'package:hawkers/Screens/otpScreen.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:hawkers/Services/api.dart';


class Login extends StatefulWidget {
  static const routeName = '/Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  RestApi restApi = RestApi();
  TextEditingController _mobileController = new TextEditingController();

  String _mobile;

  bool loading = false;
//  _login() async {
//    _mobile = _mobileController.text;

    _login() async {
      if (_formKey.currentState.validate()) {
        String body = json.encode({"phone": _mobile});
        setState(() {
          loading = true;
        });
        final response =
        await Provider.of<User>(context, listen: false).login(body);

        setState(() {
          loading = true;
        });

        if (response.success == true) {
          _mobileController.clear();
          Navigator.of(context).pushNamed(Otp.routeName);
        } else {}
      }
    }
//

//    if (_mobile != '') {
//      String body = json.encode({
//        "mobile": _mobile,
//      });
//      setState(() {
//        loading = true;
//      });


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
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
      //  elevation: 0,
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
                     // color: Colors.black12,
                      borderRadius: BorderRadius.circular(3),
                  border:Border.all(color:Colors.black45)
                  ),
                  child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Form(

                          child: TextFormField(
                              key: _formKey,
                            keyboardType: TextInputType.number,
                      //    controller: _mobileController,
                            textAlign: TextAlign.start,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black, fontSize: 21),
                            //     color:Colors.grey,

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                            ),
                              onChanged: (val) {
                                _mobile = val;
                              },
                              validator: (value) {
                                if (value.isEmpty || value.length < 10) {
                                  return 'Enter valid Phone Number';
                                }
                              } ),
                        ),
                      ))),
              SizedBox(height: 50,),
              Text(
                'Important Tip:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30,),
              Text(
                'The Hawkers is...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: SizedBox(
                  height:45,
                width:ScreenUtil().setWidth(700),
                  child: RaisedButton(
                    onPressed: (){
                      _login();
                      Navigator.pushNamed(context, Otp.routeName);
                    },
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular((3)) ),
                    color:Colors.lightGreen,
                    child: Text('Request Otp',style: TextStyle(fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color:Colors.white),),




                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
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
                        Navigator.of(context).pushNamed(Registration.routeName);
                      },
                      child: Text('Create one',
                          style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.w500,
                          )),
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