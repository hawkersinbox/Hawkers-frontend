import 'package:flutter/material.dart';
import 'package:hawkers/Screens/help.dart';
import 'package:hawkers/Screens/paymentDetails.dart';
import 'package:hawkers/Screens/paymentNumber.dart';
// import 'file:///D:/git2/Hawkers-frontend/lib/Screens/Account/profile.dart';
import 'package:hawkers/Screens/userDetails.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

import 'profile.dart';

class Account extends StatelessWidget {
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Profile()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.account_circle,size: 90,color: Colors.lightGreen,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ravi Teja',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightGreen)),
                        Text('qwerty@gmail.com',
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
