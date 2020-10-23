import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hawkers/Models/requestResponse.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/show_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:jiffy/jiffy.dart';

class AdminSalesApprove extends StatefulWidget {
  static const routeName = '/admin-sales';
  final id;
  const AdminSalesApprove({Key key, this.id}) : super(key: key);
  @override
  _AdminSalesApproveState createState() => _AdminSalesApproveState();
}

class _AdminSalesApproveState extends State<AdminSalesApprove> {
  RestApi restApi = RestApi();
  RequestDetail requestDetail;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    final response = await restApi.getsalesRequestbyID(widget.id);

    setState(() {
      requestDetail = requestDetailResponseFromJson(response.body).response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Review',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: NavigationBar(),
      body: requestDetail == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 270,
                        child: Text(
                          '  ${requestDetail?.streetAddress1 ?? ''} \n${requestDetail?.city ?? ''} \n${requestDetail?.state ?? ''} \n${requestDetail?.pincode.toString() ?? ''} ',
                          style: TextStyle(
                              fontSize: 17,
                              //fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 20,
                        color: Colors.black,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Request ID',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(width: 20),
                          Text(
                            requestDetail.id.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                //fontWeight: FontWeight.w600,
                                color: Colors.lightGreen),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(width: 55),
                          Text(
                            requestDetail.stage.toString().toUpperCase(),
                            style: TextStyle(
                                fontSize: 18,
                                //fontWeight: FontWeight.w600,
                                color: Colors.lightGreen),
                          ),
                        ],
                      ),
                      Divider(
                        height: 20,
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      label('Product Name'),
                      SizedBox(
                        height: 5,
                      ),
                      subLabel(requestDetail.product.toString()),
                      SizedBox(
                        height: 15,
                      ),
                      label('Booking Date'),
                      SizedBox(
                        height: 5,
                      ),
                      subLabel(
                          Jiffy(requestDetail.createdAt).format("MMM do yy")),
                      SizedBox(
                        height: 15,
                      ),
                      label('Payment ID'),
                      SizedBox(
                        height: 5,
                      ),
                      subLabel(requestDetail?.paymentId.toString() ?? '-'),
                      SizedBox(
                        height: 15,
                      ),
                      label('Alternate Mobile'),
                      SizedBox(
                        height: 5,
                      ),
                      subLabel(requestDetail.contactNumber),
                      SizedBox(
                        height: 15,
                      ),
                      label('Comments'),
                      SizedBox(
                        height: 5,
                      ),
                      subLabel(requestDetail.sellerComment ?? ''),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Admin Comments',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      requestDetail.stage == 'Inprogress'
                          ? Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        //   color: Colors.white10,
                                        border: Border.all(
                                            color: Colors.black, width: 0),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: TextField(
                                        // keyboardType: TextInputType.number,
                                        controller: controller,
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 19),
                                        //     color:Colors.grey,

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            )
                          : subLabel(requestDetail.adminComment ?? ''),
                      SizedBox(
                        height: 20,
                      ),
                      if (requestDetail.stage == 'Inprogress')
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: SizedBox(
                                  height: 45,
                                  // width:ScreenUtil().setWidth(700),
                                  child: RaisedButton(
                                    onPressed: () {
                                      respondReview(true);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular((3))),
                                    color: Colors.lightGreen,
                                    child: Text(
                                      'Approve',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                child: SizedBox(
                                  height: 45,
                                  child: RaisedButton(
                                    onPressed: () {
                                      respondReview(false);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular((3))),
                                    color: Colors.red,
                                    child: Text(
                                      'Reject',
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
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  respondReview(bool val) async {
    final body = jsonEncode(
        {"id": widget.id, "status": val, "comment": controller.text});
        print(body);
    RestApi restApi = RestApi();
    final response = await restApi.updateRequestStage(body);
    final responseMap = jsonDecode(response.body);
    showToast(responseMap["message"]);
    if (responseMap["success"]) {
      setState(() {
        requestDetail = null;
        getData();
      });
    }
  }

  Widget label(String name) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    );
  }

  Widget subLabel(String sub) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          sub,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.lightGreen),
        )
      ],
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
