import 'package:flutter/material.dart';
import 'package:hawkers/Screens/adminApproval/adminCommunityApproval.dart';

class CommuntiyApproval extends StatefulWidget {
  @override
  _CommuntiyApprovalState createState() => _CommuntiyApprovalState();
}

class _CommuntiyApprovalState extends State<CommuntiyApproval> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'InProgress',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: TextFormField(
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 19),
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            height: 30,
                            color: Colors.black,
                            thickness: 1,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdminCommunityApproval()));
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'REQ-1234',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                      Text(
                                        'Date:05-Sep-2020',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        'Type:Cloths',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
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
                            height: 30,
                            color: Colors.black,
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'REQ-1234',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    Text(
                                      'Date:05-Sep-2020',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      'Type:Cloths',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
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
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Divider(
                              height: 30,
                              color: Colors.black,
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'REQ-1234',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                      Text(
                                        'Date:05-Sep-2020',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        'Type:Cloths',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
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
                            Divider(
                              height: 30,
                              color: Colors.black,
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'REQ-1234',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                      Text(
                                        'Date:05-Sep-2020',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        'Type:Cloths',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
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
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
