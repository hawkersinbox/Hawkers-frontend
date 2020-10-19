import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hawkers/DataClass/UpdateUserProfile.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';


RestApi _restApi = RestApi();

TextEditingController _mobileNumberController = new TextEditingController();
TextEditingController _firstNameController = new TextEditingController();
TextEditingController _lastNameController = new TextEditingController();
TextEditingController _emailController = new TextEditingController();
TextEditingController _streetOneController = new TextEditingController();
TextEditingController _cityController = new TextEditingController();
TextEditingController _stateController = new TextEditingController();
TextEditingController _pinCodeController = new TextEditingController();



class UpdateProfile extends StatefulWidget {

  final String mFirstName;
  final String mLastName;
  final String mEmailID;
  final String mMobileNumber;
  final String mUserCity;
  final String mUserState;
  final String mUserStreetOne;
  final String mUserPinCode;

  UpdateProfile({
    this.mFirstName,
    this.mLastName,
    this.mEmailID,
    this.mMobileNumber,
    this.mUserCity,
    this.mUserState,
    this.mUserStreetOne,
    this.mUserPinCode
  });

  @override
  _UpdateProfileState createState() => _UpdateProfileState(
    mFirstName,
    mLastName,
    mEmailID,
    mMobileNumber,
    mUserCity,
    mUserState,
    mUserStreetOne,
    mUserPinCode
  );

}

class _UpdateProfileState extends State<UpdateProfile> {

  String mFirstName;
  String mLastName;
  String mEmailID;
  String mAccessToken;
  String firstAndLastName;
  String mMobileNumber;
  String mUserCity;
  String mUserState;
  String mUserStreetOne;
  String mUserPinCode;

  _UpdateProfileState(
      String firstName,
      String lastName,
      String emailID,
      String mobileNumber,
      String userCity,
      String userState,
      String userStreetOne,
      String userPinCode
      ){
    this.mFirstName = firstName;
    this.mLastName = lastName;
    this.mEmailID = emailID;
    this.mMobileNumber = mobileNumber;
    this.mUserCity = userCity;
    this.mUserState = userState;
    this.mUserStreetOne = userStreetOne;
    this.mUserPinCode = userPinCode;

    print("Mobile Number: $mMobileNumber");
    print("Update Profile FirtName: $mFirstName");
    print("Update Profile FirtName: $mLastName");
    print("Update Profile FirtName: $mEmailID");
    print("Update Profile FirtName: $mUserCity");
    print("Update Profile FirtName: $mUserState");
    print("Update Profile FirtName: $mUserStreetOne");
    print("Update Profile FirtName: $mUserPinCode");

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _value = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Update Profile',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NumField('Mobile', mMobileNumber, _mobileNumberController),
                SizedBox(
                  height: 20,
                ),
                Field('First Name', mFirstName, _firstNameController),
                SizedBox(
                  height: 20,
                ),
                Field('Last Name', mLastName,_lastNameController),
                SizedBox(
                  height: 20,
                ),
                Field('Email Address', mEmailID, _emailController),
                SizedBox(
                  height: 20,
                ),
                Field('Street Address', mUserStreetOne, _streetOneController),
                SizedBox(
                  height: 20,
                ),
           Field('City*', mUserCity, _cityController),
                SizedBox(
                  height: 20,
                ),
               Field('State*', mUserState, _stateController),
                SizedBox(height: 20,),
                NumField('Pincode', mUserPinCode, _pinCodeController),
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    child: SizedBox(
                      height: 45,
                      // width:ScreenUtil().setWidth(700),
                      child: RaisedButton(
                        onPressed: () {
                          updateUserProfile();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((3))),
                        color: Colors.lightGreen,
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget NumField(
      String name,
     String initialValue,
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
                  //   color: Colors.black12,
                    border: Border.all(color: Colors.black, width: 0),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                   controller: controller,
                    // initialValue: initialValue,
                    textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 21),
                    //     color:Colors.grey,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                )),
          ],
        ));
  }
  Widget Field(
      String name,
    String lableText,
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
              //   color: Colors.white10,
                border: Border.all(color: Colors.black, width: 0),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextFormField(
                controller: controller,
                textCapitalization: TextCapitalization.sentences,
                // initialValue: lableText,
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
    );
  }

  void updateUserProfile() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((SharedPreferences sharedPreferences) {
      String accessToken = sharedPreferences.getString("access_token");
      print("access_token: $accessToken");

      Map<String, String> _userInputMap = new Map();

      if (_mobileNumberController.text.toString() == null){
        // _userInputMap.putIfAbsent("mobile", () => _mobileNumberController.text.toString());
        _userInputMap['mobile'] = _mobileNumberController.text.toString();
        print("Mobile Controller Not Null ${_mobileNumberController.text.toString()}");
      }

      if (_firstNameController.text == null){
        _userInputMap.putIfAbsent("first_name", () => _firstNameController.text.toString());
        // _userInputMap['first_name'] = _firstNameController.text.toString();
        print("FirstName Controller Not Null ${_firstNameController.text.toString()}");
      }
      if (_lastNameController.text == null){
        _userInputMap.putIfAbsent("last_name", () => _lastNameController.text.toString());
        // _userInputMap['last_name'] = _lastNameController.text.toString();
        print("LastName Controller Not Null ${_lastNameController.text.toString()}");
      }
      if (_emailController.text == null){
        _userInputMap.putIfAbsent("email", () => _emailController.text.toString());
        // _userInputMap['email'] = _emailController.text.toString();
        print("EmailID Controller Not Null ${_emailController.text.toString()}");
      }
      if (_streetOneController.text == null){
        _userInputMap.putIfAbsent("street_address1", () => _streetOneController.text.toString());
        // _userInputMap['street_address1'] = _streetOneController.text.toString();
        print("StreetOne Controller Not Null ${_streetOneController.text.toString()}");
      }
      if (_cityController.text == null){
        _userInputMap.putIfAbsent("city", () => _cityController.text.toString());
        // _userInputMap['city'] = _cityController.text.toString();
        print("City Controller Not Null ${_cityController.text.toString()}");
      }
      if (_stateController.text == null){
        _userInputMap.putIfAbsent("state", () => _stateController.text.toString());
        // _userInputMap['state'] = _stateController.text.toString();
        print("State Controller Not Null ${_stateController.text.toString()}");
      }
      if (_pinCodeController.text == null){
        _userInputMap.putIfAbsent("pincode", () => _pinCodeController.text.toString());
        // _userInputMap['pincode'] = _pinCodeController.text.toString();
        print("PinCode Controller Not Null ${_pinCodeController.text.toString()}");
      }

      // UpdateUserProfileClass _updateProfile = new UpdateUserProfileClass(
      //   firstName:  _firstNameController.text.toString(),
      //   lastName: _lastNameController.text.toString(),
      //   email: _emailController.text.toString(),
      //   mobile: _mobileNumberController.text.toString(),
      //   city: _cityController.text.toString(),
      //   state: _stateController.text.toString(),
      //   streetAddress1: _streetOneController.text.toString(),
      //   pincode: _pinCodeController.text.toString(),
      // );
      // print("User Input Map: ${_updateProfile.toJson().toString()}");


      print("User Input Map: ${_userInputMap.toString()}");
      String body = json.encode({
        _userInputMap
      });

      var futureResponse = _restApi.updateUserProfiel(accessToken, body);
      futureResponse.then((value) {
        var responseData = jsonDecode(value.body);
        print("Response String: ${responseData.toString()}");
        Map<String, dynamic> _responseMap = json.decode(responseData) as Map;
        print("Update Profile Response Map String: ${_responseMap.toString()}");


      })
      .catchError((error){
        print("Error: ${error.toString()}");
      })
      .whenComplete(() {
        print("Update profile response get complete!");
      });

    })
        .whenComplete(() {
      print("Complete!");
    })
        .catchError((error){
      print("Error: ${error.toString()}");
    });

  }
}

