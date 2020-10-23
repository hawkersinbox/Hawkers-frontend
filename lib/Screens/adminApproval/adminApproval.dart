import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Models/salesRequestModel.dart';
import 'package:hawkers/Provider/approvalCommunity.dart';
import 'package:hawkers/Provider/approvalRequest.dart';
import 'package:hawkers/Screens/adminApproval/adminSalesApprove.dart';
import 'package:hawkers/Screens/adminApproval/component/community.dart';
import 'package:hawkers/Widgets/communityApproval.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class AdminApproval extends StatefulWidget {
  static const routeName = '/admin-approval';
  @override
  _AdminApprovalState createState() => _AdminApprovalState();
}

class _AdminApprovalState extends State<AdminApproval> {
  TabController _tabController;
  TextEditingController _queryController = new TextEditingController();

  @override
  void initState() {
    Provider.of<AprovalSales>(context, listen: false).getInitial();
    Provider.of<AprovalCommunity>(context, listen: false).getInitial();

    super.initState();
  }

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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    color: Colors.black12.withOpacity(.05),
                    child: TabBar(
                      labelColor: Colors.lightGreen,
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Text(
                            'Sales',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Community',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child:  TabBarView(
                        children: [
                       Consumer<AprovalSales>(
                      builder: (ctx, model, _) =>
                             DefaultTabController(
                              length: 3,
                              child: Column(
                                children: [
                                  Container(
                                    child: TabBar(
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
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: TextFormField(
                                      controller: _queryController,
                                      onChanged: (_) {
                                        model.setQuery(_queryController.text);
                                        print(_queryController.text);
                                        model.search();
                                      },
                                      textAlign: TextAlign.start,
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 19),
                                      decoration: InputDecoration(
                                        hintText: 'Search by id',
                                        prefixIcon: Icon(Icons.search),
                                        border: InputBorder.none,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        AllSales(),
                                        InprogressSales(),
                                        CompleteSales(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        
                       Consumer<AprovalCommunity>(
                      builder: (ctx, model, _) =>
                             DefaultTabController(
                              length: 3,
                              child: Column(
                                children: [
                                  Container(
                                    child: TabBar(
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
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: TextFormField(
                                      controller: _queryController,
                                      onChanged: (_) {
                                        model.setQuery(_queryController.text);
                                        print(_queryController.text);
                                        model.search();
                                      },
                                      textAlign: TextAlign.start,
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 19),
                                      decoration: InputDecoration(
                                        hintText: 'Search by id',
                                        prefixIcon: Icon(Icons.search),
                                        border: InputBorder.none,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        AllCommunity(),
                                        InprogressCommunity(),
                                        CompleteCommunity(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class AllSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AprovalSales>(
      builder: (ctx, model, _) => ListView.separated(
        itemCount: model.displayAllSalesRequest.length,
        separatorBuilder: (ctx, index) => Divider(
          height: 10,
          color: Colors.black,
          thickness: 2,
        ),
        itemBuilder: (ctx, index) =>
            RequestCard(salesRequest: model.displayAllSalesRequest[index]),
      ),
    );
  }
}

class InprogressSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AprovalSales>(
      builder: (ctx, model, _) => ListView.separated(
        itemCount: model.displayInprogressSalesRequest.length,
        separatorBuilder: (ctx, index) => Divider(
          height: 10,
          color: Colors.black,
          thickness: 2,
        ),
        itemBuilder: (ctx, index) => RequestCard(
            salesRequest: model.displayInprogressSalesRequest[index]),
      ),
    );
  }
}

class CompleteSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AprovalSales>(
      builder: (ctx, model, _) => ListView.separated(
        itemCount: model.displayCompletedSalesRequest.length,
        separatorBuilder: (ctx, index) => Divider(
          height: 10,
          color: Colors.black,
          thickness: 2,
        ),
        itemBuilder: (ctx, index) => RequestCard(
            salesRequest: model.displayCompletedSalesRequest[index]),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final SalesRequest salesRequest;
  const RequestCard({Key key, @required this.salesRequest}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AdminSalesApprove(id :salesRequest.id)));
      },
      child: Row(
        children: [
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  salesRequest?.id.toString() ?? '',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  Jiffy(salesRequest.createdAt).format("MMM do yy"),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Type:${salesRequest?.product ?? ''}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  salesRequest?.stage ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.lightGreen),
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
    );
  }
}
