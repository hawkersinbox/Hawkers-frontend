import 'package:flutter/material.dart';
// import 'file:///D:/git2/Hawkers-frontend/lib/Screens/Account/updateProfile.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

import 'updateProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              Text('Ravi Teja',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightGreen)),
              SizedBox(height: 5,),
              Text('qwerty@gmail.com',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              SizedBox(height: 5,),
        Divider(height: 30,thickness: 1,color: Colors.black,),
        InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateProfile()));
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
