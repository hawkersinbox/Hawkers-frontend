import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

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
              Row(
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
              Row(
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
              Row(
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
              Divider(height: 30,thickness: 1,color: Colors.black,),
              Row(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Payment details',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  Icon(Icons.arrow_forward_ios,size: 21,)
                ],
              )
            ],
          ),
        ),
      )



    );
  }
}
