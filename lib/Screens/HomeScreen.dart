import 'package:flutter/material.dart';
import 'package:hawkers/Screens/addPaymentDetails.dart';
import 'package:hawkers/Screens/addUserAdmin.dart';
import 'package:hawkers/Screens/community/communities.dart';
import 'package:hawkers/Screens/product/products.dart';
import 'package:hawkers/Screens/adminApproval/adminApproval.dart';
import 'package:hawkers/Screens/salesRequest/salesRequest.dart';
import 'package:hawkers/utils/SizeConfig.dart';

import 'Account/account.dart';


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
          height: SizeConfig.blockSizeVertical * 80,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2),
                crossAxisSpacing: 0,
                mainAxisSpacing: 0
            ),
            itemBuilder: (BuildContext context, int index){
              return GridTile(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 200,
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
                                width: 80,
                                height: 80,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child:  Center(
                                child: Text(
                                  gridViewList[index]['footer'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
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
                  )
              );
            },
            itemCount: gridViewList.length,
          ),
        )
    );
  }

}
