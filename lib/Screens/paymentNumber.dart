import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

class PaymentNumber extends StatefulWidget {
  @override
  _PaymentNumberState createState() => _PaymentNumberState();
}

class _PaymentNumberState extends State<PaymentNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Payment Number',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
              ),
              SizedBox(height: 20,),
              Text(
                'Please make payment to below number',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              SizedBox(height: 15,),
              Text(
                '+91 9293478392',
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.w600, color: Colors.lightGreen,
                letterSpacing: 1,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
