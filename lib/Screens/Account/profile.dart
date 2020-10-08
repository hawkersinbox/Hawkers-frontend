import 'package:flutter/material.dart';
import 'package:hawkers/SQLite/Database.dart';
import 'package:hawkers/SQLite/User.dart';
// import 'file:///D:/git2/Hawkers-frontend/lib/Screens/Account/updateProfile.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'updateProfile.dart';


List<AppUser> _appUserList = new List();

class Profile extends StatefulWidget {

  final String mFirstName;
  final String mLastName;
  final String mEmailID;
  final String mMobileNumber;
  final String mUserCity;
  final String mUserState;
  final String mUserStreetOne;
  final String mUserPinCode;

  Profile({
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
  _ProfileState createState() => _ProfileState(
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

class _ProfileState extends State<Profile> {

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


  String space = " ";

  _ProfileState(
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
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Manage Account',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Remove Account'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),

                );
              }).toList();
            },
            icon: Icon(Icons.more_vert,color: Colors.black,size: 30,),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Icon(Icons.account_circle,color: Colors.lightGreen,size: 100,)),
              SizedBox(height: 7,),
              Text(
                '$mFirstName$space$mLastName'
              ,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightGreen)),
              SizedBox(height: 5,),
              Text(
              mEmailID,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              SizedBox(height: 5,),
        Divider(height: 30,thickness: 1,color: Colors.black,),
        InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateProfile(
              mFirstName: mFirstName,
              mLastName: mLastName,
              mEmailID: mEmailID,
              mMobileNumber: mMobileNumber,
              mUserCity: mUserCity,
              mUserState: mUserState,
              mUserStreetOne: mUserStreetOne,
              mUserPinCode: mUserPinCode,
            )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Update Profile',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              Icon(Icons.arrow_forward_ios,size: 21,)
            ],
          ),
        ),
        Divider(height: 30,thickness: 1,color: Colors.black,),

            ],
          ),
        ),
      ),
    );
  }
  void handleClick(String value) {
    switch (value) {
      case 'Edit':
        break;
      case 'Remove Account':
        break;
    }
  }


}
