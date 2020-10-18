
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/paymentDetails.dart';
import 'package:hawkers/Widgets/navigationBar.dart';


class PaymentInfo extends StatefulWidget {
  @override
  _PaymentInfoState createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  List<Payment> detail;

  @override
  void initState(){
    detail=Payment.getPaymentDetails();
    super.initState();
  }
  DataTable dataBody(){
    return DataTable(
      columns: [
        DataColumn(
          label: Text('User Name',    style: TextStyle(
              fontSize: 17,
     //   fontWeight: FontWeight.w600,
              color: Colors.lightGreen),
    ),
          numeric:false,


        ),
        DataColumn(
            label: Text('Request ID',    style: TextStyle(
                fontSize: 17,
              //  fontWeight: FontWeight.w600,
                color: Colors.lightGreen),
            ),
          numeric:false,


        ),
        DataColumn(
          label: Text('Payment ID',    style: TextStyle(
              fontSize: 17,
           //   fontWeight: FontWeight.w600,
              color: Colors.lightGreen),
          ),
          numeric:false,


        ),
        DataColumn(
          label: Text('Amount',    style: TextStyle(
              fontSize: 17,
            //  fontWeight: FontWeight.w600,
              color: Colors.lightGreen),
          ),
          numeric:false,


        ),
        DataColumn(
          label: Text('Mode',    style: TextStyle(
              fontSize: 17,
           //   fontWeight: FontWeight.w600,
              color: Colors.lightGreen),
          ),
          numeric:false,

        ),
        DataColumn(
          label: Text('Date',    style: TextStyle(
              fontSize: 17,
              //   fontWeight: FontWeight.w600,
              color: Colors.lightGreen),
          ),
          numeric:false,


        ),
        DataColumn(
          label: Text('Status',    style: TextStyle(
              fontSize: 17,
              //   fontWeight: FontWeight.w600,
              color: Colors.lightGreen),
          ),
          numeric:false,

        ),


      ],
      rows: detail.map(
          (payment)=>DataRow(
            cells: [
              DataCell(
                Text(payment.UserName)
              ),
              DataCell(
                  Text(payment.RequestID)
              ),
              DataCell(
                  Text(payment.PaymentID),
              ),
              DataCell(
                  Text(payment.Amount)
              ),
              DataCell(
                  Text(payment.Mode)
              ),
              DataCell(
                  Text(payment.Date)
              ),
              DataCell(
                  Text(payment.Status)
              )
            ]
          )
      ).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment Info',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Edit', 'Delete'}.map((String choice) {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: dataBody()),
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
      case 'Delete':
        break;
    }
  }
}

