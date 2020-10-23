import 'package:flutter/material.dart';
import 'package:hawkers/Models/salesRequestModel.dart' as model;
import 'package:hawkers/Provider/SalesRequestProvider.dart';
import 'package:hawkers/Screens/salesRequest/createSalesRequest.dart';
import 'package:hawkers/Screens/salesRequest/raiseSalesRequest.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class SalesRequest extends StatefulWidget {
  static const routeName = '/salesRequest';

  @override
  _SalesRequestState createState() => _SalesRequestState();
}

class _SalesRequestState extends State<SalesRequest> {
  bool isLoading = true;
  @override
  void initState() {
    getSalesRequest();
    super.initState();
  }

  getSalesRequest() async {
    await Provider.of<SalesRequestProvider>(context, listen: false)
        .getSalesRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('Sales Request',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              child: Consumer<SalesRequestProvider>(
                builder: (ctx, data, _) => ListView.builder(
                  itemCount: data.salesRequests.length,
                  itemBuilder: (ctx, index) =>
                      SalesRequestTile(data.salesRequests[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SalesRequestTile extends StatelessWidget {
  final model.SalesRequest salesRequest;
  SalesRequestTile(this.salesRequest);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Divider(
            height: 3,
            thickness: 3,
          ),
          SizedBox(
            height: 15,
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
                      'REQ-${salesRequest.id}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Date: ${Jiffy(salesRequest.createdAt).format("MMM do yy")}',
                    ),
                    Text('Type: ${salesRequest.product}')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
