import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hawkers/SQLite/User.dart';
import 'package:hawkers/Screens/otpScreen.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/colors.dart';
import 'package:hawkers/Utility/constant.dart';
import 'package:hawkers/Utility/show_toast.dart';
import 'package:hawkers/Widgets/custumButton.dart';

class Registration extends StatefulWidget {
  static const routeName = '/Registration';
  @override
  _RegistrationState createState() => _RegistrationState();
}

//
class _RegistrationState extends State<Registration> {
  FocusNode _focus = new FocusNode();

  RestApi restApi = RestApi();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _streetaddressController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _pincodeController = new TextEditingController();

  String _mobile;
  String _email;
  String _firstname;
  String _lastname;
  String _city;
  String _streetaddress;
  String _state;
  String _pincode;
  bool _isLoading = false;
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  _registerUser() async {
    _mobile = _mobileController.text;
    _firstname = _firstnameController.text;
    _lastname = _lastnameController.text;
    _email = _emailController.text;
    _state = _stateController.text;
    _city = _cityController.text;
    _pincode = _pincodeController.text;
    _streetaddress = _streetaddressController.text;

    print("Mobile Number: ${_mobileController.text}");
    print("First Name: ${_firstnameController.text}");
    print("Last Name: ${_lastnameController.text}");
    print("Email: ${_emailController.text}");
    print("State: ${_stateController.text}");
    print("City: ${_cityController.text}");
    print("PinCode: ${_pincodeController.text}");
    print("StreetAddressOne: ${_streetaddressController.text}");

    String body = json.encode({
      'email': _email,
      'mobile': _mobile,
      'first_name': _firstname,
      'last_name': _lastname,
      'city': _city,
      'state': _state,
      'street_address1': _streetaddress,
      'pincode': _pincode
    });
    print(body);

    if (_mobile != '' &&
        _email != '' &&
        _firstname != '' &&
        _lastname != '' &&
        _city != '' &&
        _state != '' &&
        _streetaddress != '' &&
        _pincode != '') {
      setState(() {
        _isLoading = true;
      });

      var responseData;
      try {
        final response = await restApi.register(body);
        responseData = jsonDecode(response.body);
        print("Registration Response: ${responseData.toString()}");
        print("Registration Response: ${response.body.toString()}");
      } catch (e) {
        print("Error: ${e.toString()}");
      }
      if (responseData["success"]) {
        _mobileController.clear();
        _firstnameController.clear();
        _lastnameController.clear();
        _emailController.clear();
        _cityController.clear();
        _stateController.clear();
        _streetaddressController.clear();
        _pincodeController.clear();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otp(
                    isSignUp: true,
                    mobile: _mobile,
                    email: _email,
                    firstname: _firstname,
                    lastname: _lastname,
                    city: _city,
                    state: _state,
                    streetaddress: _streetaddress,
                    pincode: _pincode,
                  )),
        );
      } else {
        showToast(responseData["message"] ?? '');
      }
      setState(() {
        _isLoading = false;
      });
    } else {
      showToast(errorInvalidInput);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'My account',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
              child: Column(
            children: [
              Field("First Name*", _firstnameController),
              SizedBox(
                height: 20,
              ),
              Field('Last Name*', _lastnameController),
              SizedBox(height: 20),
              NumField('Mobile Number*', _mobileController,
                  maxcount: 10, prefix: '+91 '),
              SizedBox(
                height: 20,
              ),
              Field('Email Address', _emailController),
              SizedBox(
                height: 20,
              ),
              Field('Street Address*', _streetaddressController),
              SizedBox(
                height: 20,
              ),
              Place('City*', _cityController),
              SizedBox(
                height: 20,
              ),
              Place('State*', _stateController),
              SizedBox(
                height: 20,
              ),
              NumField(
                'Pincode*',
                _pincodeController,
                maxcount: 10,
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon(Icons.check_box_outline_blank),
                  Checkbox(
                      value: rememberMe,
                      activeColor: Colors.black,
                      onChanged: _onRememberMeChanged),

                  Text('Receive product updates',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustumButton(
                isLoading: _isLoading,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _registerUser();
                },
                title: 'Create Account',
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Log In',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('If there is already Hawkers account,',
                      style: TextStyle(fontSize: 20, color: Colors.lightGreen)),
                  Text('please login using that account,',
                      style: TextStyle(fontSize: 20, color: Colors.lightGreen))
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Field(
    String name,
    TextEditingController controller,
  ) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
                color: hawkersLightGrey,
                border: Border.all(color: Colors.black, width: 0),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 21),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Place(String name, TextEditingController controller) {
    return Container(
//height: 35,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 5,
          ),
          Stack(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                    //  color: Colors.black12,
                    border: Border.all(color: Colors.black, width: 0),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    autofocus: true,
                    controller: controller,
                    textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 21),
                    //     color:Colors.grey,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget NumField(
    String name,
    TextEditingController controller, {
    prefix,
    @required maxcount,
  }) {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            height: 45,
            decoration: BoxDecoration(
                //   color: Colors.black12,
                border: Border.all(color: Colors.black, width: 0),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controller,
                maxLength: maxcount,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 21),
                decoration: InputDecoration(
                  counterText: '',
                  prefix: Text(prefix ?? ''),
                  contentPadding: EdgeInsets.only(top: 1),
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            )),
      ],
    ));
  }
}
