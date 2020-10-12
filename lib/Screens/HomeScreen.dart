import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hawkers/DataClass/UsreInfo.dart';
import 'package:hawkers/Models/Product.dart';
import 'package:hawkers/Screens/addPaymentDetails.dart';
import 'package:hawkers/Screens/addUserAdmin.dart';
import 'package:hawkers/Screens/adminApproval/adminApproval.dart';
import 'package:hawkers/Screens/community/communities.dart';
import 'package:hawkers/Screens/product/addProducts.dart';
import 'package:hawkers/Screens/product/products.dart';
import 'package:hawkers/Screens/salesRequest/salesRequest.dart';
import 'package:hawkers/Screens/userRequest.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/SizeConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Account/account.dart';


String mFirstName;
String mLastName;
String mEmailID;
String mMobileNo;
String mUserCity;
String mUserState;
String mUserStreetOne;
String mUserPinCode;
var restApi = RestApi();

var gridViewList = [
  {
    "footer": "Sales Request",
    "image": "assets/icons/sales_requests.png"
  },
  {
    "footer": "Communities",
    "image": "assets/icons/communities.png"
  },
  {
    "footer": "Approval",
    "image": "assets/icons/approval.png"
  },
  {
    "footer": "Add User",
    "image": "assets/icons/add_users.png"
  },
  {
    "footer": "Products",
    "image": "assets/icons/products.png"
  },
  {
    "footer": "Add Payment",
    "image": "assets/icons/payments.png"
  }
];


 class HomeScreen extends StatefulWidget {
   @override
   _HomeScreenState createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {

   @override
  void initState() {
    getUserDetails();
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     SizeConfig().init(context);
     return Scaffold(
         backgroundColor: Colors.white,
         appBar: AppBar(
           title: Text('Hawkers',
               style: TextStyle(
                   color: Colors.lightGreen,
                   fontSize: 26,
                   fontWeight: FontWeight.w600)),
           centerTitle: true,
           backgroundColor: Colors.white,
           // elevation: 0,
         ),
         bottomNavigationBar: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: 60,
             child: Column(
               children: [
                 Divider(height: 10,color:Colors.grey,
                   thickness: 1,),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                     Icon(Icons.add,
                         color:Colors.black,
                         size:40),

                     Icon(Icons.home,
                         color:Colors.black,
                         size:40),
                     InkWell(
                       onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>Account(
                           firstName: mFirstName,
                           lastName: mLastName,
                           emailID: mEmailID,
                           mMobileNumber: mMobileNo,
                           mUserCity: mUserCity,
                           mUserState: mUserState,
                           mUserStreetOne: mUserStreetOne,
                           mUserPinCode: mUserPinCode,
                         )));
                       },
                       child: Icon(Icons.person_outline,
                           color:Colors.black,
                           size:40),
                     ),

                   ],
                 )
               ],
             ),
           ),
         ),
         body: LayoutBuilder(
           builder: (context, constraint) {
             return SingleChildScrollView(
               child: ConstrainedBox(
                 constraints: BoxConstraints(minHeight: constraint.maxHeight),
                 child: IntrinsicHeight(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       // SizedBox(height: 10,),
                       Padding(
                         padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                         child: Text(
                             'UPCOMING',
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.grey)
                         ),
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       Container(
                         height: 80,
                         child: ListView.builder(
                           itemCount: 4,
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (ctx, index) => Card(
                               elevation: 2,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(3.0),
                               ),
                               child: Container(
                                 height: 80,
                                 width: 180,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Flexible(
                                       flex: 1,
                                       child: Padding(
                                         padding: EdgeInsets.all(5),
                                         child: Image(
                                           image: AssetImage(
                                               'assets/icons/apartment.png'
                                           ),
                                         ),
                                       ),
                                     ),
                                     Flexible(
                                       flex: 2,
                                       child: Padding(
                                         padding: EdgeInsets.all(5),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Padding(
                                               padding: EdgeInsets.all(2),
                                               child: Text(
                                                 'Community Name',
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   color: Colors.black,
                                                 ),
                                               ),
                                             ),
                                             Padding(
                                               padding: EdgeInsets.all(2),
                                               child: Text(
                                                 'Date',
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   color: Colors.black,
                                                 ),
                                               ),
                                             ),
                                             Padding(
                                               padding: EdgeInsets.all(2),
                                               child: Text(
                                                 'Type',
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   color: Colors.black,
                                                 ),
                                               ),
                                             )
                                           ],
                                         ),
                                       ),
                                     ),

                                   ],
                                 ),
                               )),
                         ),
                       ),
                       Divider(
                         height: 40,
                         color: Colors.black,
                         thickness: 1,
                       ),
                       // SizedBox(height: 20,),
                       Padding(
                         padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                         child: Text(
                             'COLLECTIONS',
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.grey)
                         ),
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       collections(context),
                     ],
                   ),
                 ),
               ),
             );
           },
         )
     );
   }


   Widget collections(context){
     return Padding(
         padding: EdgeInsets.all(5),
         child: Container(
           width: SizeConfig.blockSizeHorizontal * 100,
           height: SizeConfig.blockSizeVertical * 60,
           child: GridView.builder(
             scrollDirection: Axis.vertical,
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: 2,
                 crossAxisSpacing: 0,
                 mainAxisSpacing: 0
             ),
             itemBuilder: (BuildContext context, int index){
               return InkWell(
                 onTap: (){
                   _gridViewOnTap(context, index);
                 },
                 child: GridTile(
                   child: Padding(
                     padding: EdgeInsets.all(5),
                     child: Container(
                       height: 150,
                       child: Card(
                         elevation: 2,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(5.0),
                         ),
                         child: Column(
                           children: [
                             Padding(
                               padding: EdgeInsets.all(5),
                               child: Image(
                                 image: AssetImage(
                                     gridViewList[index]['image']
                                 ),
                                 width: 50,
                                 height: 50,
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.all(5),
                               child:  Center(
                                 child: Text(
                                   gridViewList[index]['footer'],
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w300,
                                       color: Colors.black
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
               );
             },
             itemCount: gridViewList.length,
           ),
         )
     );
   }

   void _gridViewOnTap(BuildContext context, int index) {
     switch (index){
       case 0:
         salesRequestClicked(context);
         break;
       case 1:
         communitiesClicked(context);
         break;
       case 2:
         approvalClicked(context);
         break;
       case 3:
         addUserClicked(context);
         break;
       case 4:
         productsClicked(context);
         break;
       case 5:
         addPaymentClicked(context);
         break;


     }
   }

   void salesRequestClicked(BuildContext context) {
     Navigator.of(context)
         .push(MaterialPageRoute(
         builder: (context)=> SalesRequest()
     ));
   }

   void communitiesClicked(BuildContext context) {
     Navigator.of(context)
         .push(MaterialPageRoute(
         builder: (context)=> Communities()
     ));
   }

   void approvalClicked(BuildContext context) {
     Navigator.of(context)
         .push(MaterialPageRoute(
         builder: (context)=> AdminApproval()
     ));
   }

   void addUserClicked(BuildContext context) {
     Navigator.of(context)
         .push(MaterialPageRoute(
         builder: (context)=> AddUserAdmin()
     ));
   }

   void productsClicked(BuildContext context) {
     Navigator.of(context)
         .push(MaterialPageRoute(
         builder: (context)=> ProductList()
     ));
   }

   void addPaymentClicked(BuildContext context) {
     Navigator.of(context)
         .push(MaterialPageRoute(
         builder: (context)=> AddPayment()
     ));
   }

  void getUserDetails() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    _prefs.then((SharedPreferences sharedPreferences) {
      String accessToken = sharedPreferences.getString("access_token");
      print("access_token: $accessToken");
      var response = restApi.getUserInfo(accessToken);
      response.then((value) {
        var responseBody = value.body;
        print("User Info Response: ${responseBody.toString()}");

        print("Response String: $response}");
        Map<String, dynamic> _map = json.decode(responseBody) as Map;
        print("Map String: ${_map.toString()}");

        var resp = new UserInfoClass.fromJson(_map);

        if (resp.success){
          print("Response Message: ${resp.message}");
          mFirstName = resp.response.firstName;
          mLastName = resp.response.lastName;
          mEmailID = resp.response.email;
          mMobileNo = resp.response.mobile;
          mUserCity = resp.response.city;
          mUserState = resp.response.state;
          mUserStreetOne = resp.response.streetAddress1;
          mUserPinCode = resp.response.pincode;
        }else {
          print("Response Success ${resp.success.toString()}");
        }


      })
          .catchError((error){
        print("Error: ${error.toString()}");
      })
          .whenComplete(() {
            print("Complete!");
      });
    })
        .whenComplete(() {
      print("Complete!");
    })
        .catchError((error){
      print("Error: ${error.toString()}");
    });

  }

  void getSalesRequests(String access_token){
    var response = restApi.getSalesRequests(access_token);

    response.then((value) {

      var responseBody = value.body;
      print("Open Sales Request Response: ${responseBody.toString()}");

      print("Response String: $response}");
      Map<String, dynamic> _map = json.decode(responseBody) as Map;
      print("Map String: ${_map.toString()}");

      var resp = new UserInfoClass.fromJson(_map);

    })
    .catchError((error){
      print("Error: ${error.toString()}");
    })
    .whenComplete(() {
      print("Complete!");
    });
  }

 }

