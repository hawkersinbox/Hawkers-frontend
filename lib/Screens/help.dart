import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Help',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 200,
              ),
              Text(
                'https://www.youtube.com/',
                style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w600, color: Colors.blue,
                  decoration: TextDecoration.underline,
                  letterSpacing: 1,
                ),
              ),
              Divider(height: 40,color: Colors.black,thickness: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.phone,color: Colors.black,size: 45,),
                  SizedBox(width: 20,),
                  Text(
                    '+91 9876542345',
                    style: TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600, color: Colors.black,

                    ),
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.phone,color: Colors.black,size: 45,),
                  SizedBox(width: 20,),
                  Text(
                    '+91 9876542345',
                    style: TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600, color: Colors.black,

                    ),
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.mail,color: Colors.black,size: 45,),
                  SizedBox(width: 20,),
                  Text(
                    'Hawkersinbox@gmail.com',
                    style: TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600, color: Colors.black,

                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
