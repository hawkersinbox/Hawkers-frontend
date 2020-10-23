import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/constant.dart';
import 'package:hawkers/Utility/show_toast.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:jiffy/jiffy.dart';

class AddPayment extends StatefulWidget {
  @override
  _AddPaymentState createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  var _value = 'Credit/Debit Card';
  RestApi restApi = RestApi();
  bool _isLoading = false;
  DateTime dateTime = DateTime.now();
  TextEditingController mobileController = TextEditingController();
  TextEditingController requestIDController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Payment',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NumField('Mobile No', mobileController),
                SizedBox(
                  height: 20,
                ),
                Field('Request ID*', requestIDController),
                SizedBox(
                  height: 20,
                ),
                NumField('Amount', amountController),
                SizedBox(
                  height: 20,
                ),
                Text('Mode of Payment*',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                      //   color: Colors.white10,
                      border: Border.all(color: Colors.black, width: 0),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                    ),
                    child: DropdownButtonFormField(
                      iconSize: 35,
                      style: TextStyle(
                          fontSize: 19,
                          //  fontWeight: FontWeight.w600,
                          color: Colors.black),
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text("Credit/Debit Card"),
                          value: 'Credit/Debit Card',
                        ),
                        DropdownMenuItem(
                          child: Text("GPay"),
                          value: 'GPay',
                        ),
                        DropdownMenuItem(
                          child: Text("PhonePe"),
                          value: 'PhonePe',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                displayDate('Payment Date*'),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    child: SizedBox(
                      height: 45,
                      // width:ScreenUtil().setWidth(700),
                      child: RaisedButton(
                        onPressed: () {
                          addPayment();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((3))),
                        color: Colors.lightGreen,
                        child: Text(
                          'Add Payment',
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addPayment() async {
    if (mobileController.text != '' &&
        requestIDController.text != '' &&
        amountController.text != '') {
      final body = jsonEncode({
        "mobile": mobileController.text,
        "request_id": requestIDController.text,
        "amount": amountController.text,
        "mode": _value,
        "payment_date": dateTime.toUtc().toString(),
      });

      print(body);

      setState(() {
        _isLoading = true;
      });

      var responseData;
      try {
        final response = await restApi.createPayment(
          body,
        );
        responseData = jsonDecode(response.body);

        if (responseData["success"]) {
          Navigator.pop(context);
        }
        showToast(responseData["message"]);
      } catch (e) {
        showToast(errorMessage);
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      showToast('Invalid Input');
    }
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: dateTime,
    );
    if (date != null)
      setState(() {
        dateTime = date;
      });
  }

  Widget NumField(
    String name,
    TextEditingController controller,
  ) {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            height: 45,
            decoration: BoxDecoration(
                //   color: Colors.black12,
                border: Border.all(color: Colors.black, width: 0),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 21),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            )),
      ],
    ));
  }

  Widget Field(
    String name,
    TextEditingController controller,
  ) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
                //   color: Colors.white10,
                border: Border.all(color: Colors.black, width: 0),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 21),
                //     color:Colors.grey,

                decoration: InputDecoration(
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget displayDate(
    String name,
  ) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
                //   color: Colors.white10,
                border: Border.all(color: Colors.black, width: 0),
                borderRadius: BorderRadius.circular(3)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: InkWell(
                  child: InkWell(
                    onTap: () {
                      _pickDate();
                    },
                    child: Text(Jiffy(dateTime).format("MMM do yy"),
                        style: TextStyle(color: Colors.black, fontSize: 21)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
