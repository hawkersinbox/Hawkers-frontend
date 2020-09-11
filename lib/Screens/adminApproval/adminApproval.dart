import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Screens/adminApproval/adminSalesApprove.dart';
import 'package:hawkers/Widgets/communityApproval.dart';

class AdminApproval extends StatefulWidget {
  static const routeName = '/admin-approval';
  @override
  _AdminApprovalState createState() => _AdminApprovalState();
}

class _AdminApprovalState extends State<AdminApproval> {
  TabController _tabController;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,


        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  color: Colors.black12.withOpacity(.05),
                  child: TabBar(
            //    labelStyle: TextStyle(color: Colors.indigoAccent),

            labelColor: Colors.lightGreen,
              indicatorColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,

              tabs: [
                Tab(
                  child: Text('Sales',
                    style:TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Tab(
                  child: Text('Community',
                    style:TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                )
              ],
            ),

                  ),
                SizedBox(height: 20,),

                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              Container(
                               // color: Colors.black12.withOpacity(.05),
                                child: TabBar(
                                  //    labelStyle: TextStyle(color: Colors.indigoAccent),

                                  labelColor: Colors.lightGreen,
                                  indicatorColor: Colors.transparent,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  unselectedLabelColor: Colors.grey,

                                  tabs: [
                                    Tab(
                                      child: Text('All',
                                        style:TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                    ),
                                    Tab(
                                      child: Text('InProgress',
                                        style:TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                    ),
                                    Tab(
                                      child: Text('Completed',
                                        style:TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                    )
                                  ],
                                ),

                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        //color: Colors.black12.withOpacity(.03),
                                        child: Column(
                                          children: [


                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height:45,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.grey)
                                                    ),
                                                    child: TextFormField(
                                                      textAlign: TextAlign.start,
                                                      cursorColor: Colors.black,
                                                      style: TextStyle(color: Colors.black, fontSize: 19),
                                                      decoration: InputDecoration(
                                                        hintText: 'Search',
                                                        prefixIcon: Icon(Icons.search),
                                                        suffixIcon: Icon(Icons.mic),
                                                        border: InputBorder.none,
                                                        floatingLabelBehavior: FloatingLabelBehavior.never,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20,),
                                                Icon(Icons.filter_list,size: 40,)
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Divider(
                                              height: 30,color: Colors.black,thickness: 1,
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Navigator.push(context,MaterialPageRoute(builder: (context)=>AdminSalesApprove()));
                                              },
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 25,),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                      Text(
                                                      'REQ-1234',
                                                      style: TextStyle(
                                                          fontSize: 18,

                                                          color: Colors.black),
                                                    ),
                                                        Text(
                                                          'Date:05-Sep-2020',
                                                          style: TextStyle(
                                                              fontSize: 16,

                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          'Type:Cloths',
                                                          style: TextStyle(
                                                              fontSize: 16,

                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(height: 5,),

                                                        Text(
                                                          'Inprogress',
                                                          style: TextStyle(
                                                              fontSize: 16,

                                                              color: Colors.lightGreen),
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black,
                                                    size: 25,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              height: 30,color: Colors.black,thickness: 1,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(width: 25,),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'REQ-1234',
                                                        style: TextStyle(
                                                            fontSize: 18,

                                                            color: Colors.black),
                                                      ),
                                                      Text(
                                                        'Date:05-Sep-2020',
                                                        style: TextStyle(
                                                            fontSize: 16,

                                                            color: Colors.black),
                                                      ),
                                                      Text(
                                                        'Type:Cloths',
                                                        style: TextStyle(
                                                            fontSize: 16,

                                                            color: Colors.black),
                                                      ),
                                                      SizedBox(height: 5,),

                                                      Text(
                                                        'Inprogress',
                                                        style: TextStyle(
                                                            fontSize: 16,

                                                            color: Colors.lightGreen),
                                                      ),


                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.black,
                                                  size: 25,
                                                )
                                              ],
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(),
                                    Container(),
                                  ],
                                ),
                              )


                            ],
                          ),
                        )
                      ),
                      Container(
                        child: CommuntiyApproval()
                      )
                    ],

                  ),
                )

              ],
            ),
          ),
        ),
      )
    );
  }
}
