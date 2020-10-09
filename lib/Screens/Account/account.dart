
import 'package:flutter/material.dart';
import 'package:hawkers/DataClass/UsreInfo.dart';
import 'package:hawkers/Models/userModel.dart';
import 'package:hawkers/SQLite/Database.dart';
import 'package:hawkers/SQLite/User.dart';
import 'package:hawkers/Screens/help.dart';
import 'package:hawkers/Screens/paymentDetails.dart';
import 'package:hawkers/Screens/paymentNumber.dart';
import 'package:hawkers/Screens/userDetails.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/userData.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile.dart';



var restApi = RestApi();

class Account extends StatefulWidget {

  final String firstName;
  final String lastName;
  final String emailID;
  final String mMobileNumber;
  final String mUserCity;
  final String mUserState;
  final String mUserStreetOne;
  final String mUserPinCode;

  Account({
    this.firstName,
    this.lastName,
    this.emailID,
    this.mMobileNumber,
    this.mUserCity,
    this.mUserState,
    this.mUserStreetOne,
    this.mUserPinCode
  });

  @override
  _AccountState createState() => _AccountState(
    firstName,
    lastName,
    emailID,
    mMobileNumber,
    mUserCity,
    mUserState,
    mUserStreetOne,
    mUserPinCode
  );
}

class _AccountState extends State<Account> {

  String mFirstName;
  String mLastName;
  String mEmailID;
  String mMobileNo;
  String mUserCity;
  String mUserState;
  String mUserStreetOne;
  String mUserPinCode;

  _AccountState(
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
    this.mUserCity = userCity;
    this.mUserState = userState;
    this.mUserStreetOne = userStreetOne;
    this.mUserPinCode = userPinCode;
  }

  String space = " ";

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Account',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          centerTitle: true,
        ),
        bottomNavigationBar: NavigationBar(),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Profile(
                      mFirstName: mFirstName,
                      mLastName: mLastName,
                      mEmailID: mEmailID,
                      mMobileNumber: mMobileNo,
                      mUserCity: mUserCity,
                      mUserState: mUserState,
                      mUserStreetOne: mUserStreetOne,
                      mUserPinCode: mUserPinCode,
                    )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.account_circle,size: 90,color: Colors.lightGreen,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '$mFirstName$space$mLastName',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.lightGreen)
                          ),
                          Text(
                              mEmailID,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Icon(Icons.arrow_forward_ios,size: 21,)
                    ],
                  ),
                ),
                Divider(height: 30,thickness: 1,color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notifications',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    Icon(Icons.arrow_forward_ios,size: 21,)
                  ],
                ),
                Divider(height: 30,thickness: 1,color: Colors.black,),
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>PaymentNumber()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment Info',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Icon(Icons.arrow_forward_ios,size: 21,)
                    ],
                  ),
                ),
                Divider(height: 30,thickness: 1,color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('About the App',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    Icon(Icons.arrow_forward_ios,size: 21,)
                  ],
                ),
                Divider(height: 30,thickness: 1,color: Colors.black,),
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Help()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Need help?',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Icon(Icons.arrow_forward_ios,size: 21,)
                    ],
                  ),
                ),
                Divider(height: 30,thickness: 1,color: Colors.black,),
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>UserDetails()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('User details',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Icon(Icons.arrow_forward_ios,size: 21,)
                    ],
                  ),
                ),
                Divider(height: 30,thickness: 1,color: Colors.black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Account & Privacy',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    Icon(Icons.arrow_forward_ios,size: 21,)
                  ],
                ),
                Divider(height: 30,thickness: 1,color: Colors.black,),
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>PaymentInfo()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment details',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Icon(Icons.arrow_forward_ios,size: 21,)
                    ],
                  ),
                )
              ],
            ),
          ),
        )



    );
  }


}

