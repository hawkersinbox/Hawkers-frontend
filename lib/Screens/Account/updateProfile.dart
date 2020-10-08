import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

    print("Update Profile FirtName: $mFirstName");
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
                NumField('Mobile', mMobileNumber),
                SizedBox(
                  height: 20,
                ),
                Field('First Name', mFirstName),
                SizedBox(
                  height: 20,
                ),
                Field('Last Name', mLastName),
                SizedBox(
                  height: 20,
                ),
                Field('Email Address', mEmailID),
                SizedBox(
                  height: 20,
                ),
                Field('Street Address', mUserStreetOne),
                SizedBox(
                  height: 20,
                ),
           Field('City*', mUserCity),
                SizedBox(
                  height: 20,
                ),
               Field('State*', mUserState),
                SizedBox(height: 20,),
                NumField('Pincode', mUserPinCode),
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    child: SizedBox(
                      height: 45,
                      // width:ScreenUtil().setWidth(700),
                      child: RaisedButton(
                        onPressed: () {


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
     String initialValue
     // TextEditingController controller,
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
                   // controller: controller,
                    initialValue: initialValue,
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
    String lableText
    //  TextEditingController controller,
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
                textCapitalization: TextCapitalization.sentences,
                initialValue: lableText,
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
}

