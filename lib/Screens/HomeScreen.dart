import 'package:flutter/material.dart';
import 'package:hawkers/Screens/addPaymentDetails.dart';
import 'package:hawkers/Screens/addUserAdmin.dart';
import 'package:hawkers/Screens/community/communities.dart';
import 'package:hawkers/Screens/product/products.dart';
import 'package:hawkers/Screens/adminApproval/adminApproval.dart';
import 'package:hawkers/Screens/salesRequest/salesRequest.dart';

import 'Account/account.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
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
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Account()));
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10,),
              Text('UPCOMING',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Container(
                        height: 70,
                        width: 150,
                        child: Column(
                          children: [
                            Text(
                              'Request',
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '123',
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey,
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
              Text('COLLECTIONS',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(SalesRequest.routeName),
                    child: card(
                      'Sales Request',
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Communities.routeName);
                      },
                      child: card('Communities')),
                ),
                //   card('Products'),
              ]),

              Row(children: [
                Expanded(child: InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>AdminApproval()));
                  },
                    child: card('Approval'))),

                Expanded(child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AddUserAdmin()));
                    },
                    child: card('Add User'))),

                // card('Add Payment'),
              ]),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ProductList.routeName);
                        },
                        child: card('Products')),
                  ),
                  Expanded(child: InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>AddPayment()));
                      },
                      child: card('Add Payment'))),
                  // card('Add Payment'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget card(String name) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Container(
          height: 70,
          // width: 177,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
