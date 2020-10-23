import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hawkers/Models/communityDetailResponse.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Utility/show_toast.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:image_picker/image_picker.dart';

class AdminCommunityApproval extends StatefulWidget {
  final id;
  static const routeName = '/admin-community';

  const AdminCommunityApproval({Key key, this.id}) : super(key: key);
  @override
  _AdminCommunityApprovalState createState() => _AdminCommunityApprovalState();
}

class _AdminCommunityApprovalState extends State<AdminCommunityApproval> {
  RestApi restApi = RestApi();
  CommunityDetail communityDetail;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    final response = await restApi.getCommunitybyID(widget.id);

    setState(() {
      communityDetail = communityDetailResponseFromJson(response.body).response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Community Review',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: NavigationBar(),
        body: communityDetail == null
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
                              communityDetail.id.toString(),
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
                              communityDetail.stage.toUpperCase(),
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
                        Container(
                          height: 100,
                        ),
                        SizedBox(height: 10),
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
                            '  ${communityDetail?.streetAddress1 ?? ''} \n${communityDetail?.city ?? ''} \n${communityDetail?.state ?? ''} \n${communityDetail?.pincode.toString() ?? ''} ',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.lightGreen),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        label('Mobile Number'),
                        SizedBox(
                          height: 5,
                        ),
                        subLabel(communityDetail.contactNumber),
                        SizedBox(
                          height: 15,
                        ),
                        label('Rent'),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        label('Alternate Mobile'),
                        SizedBox(
                          height: 5,
                        ),
                        subLabel(communityDetail.alternateContactNumber ?? ''),
                        SizedBox(
                          height: 15,
                        ),
                        label('Email'),
                        SizedBox(
                          height: 5,
                        ),
                        subLabel(communityDetail.email ?? ''),
                        SizedBox(
                          height: 15,
                        ),
                        label('Max stall count'),
                        SizedBox(
                          height: 5,
                        ),
                        subLabel(
                            communityDetail.maxShopCount.toString() ?? ' - '),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                                  // width:ScreenUtil().setWidth(700),
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
              ));
  }

  respondReview(bool val) async {
    final body = jsonEncode({"id": widget.id, "status": val});
    print(body);
    RestApi restApi = RestApi();
    final response = await restApi.updateCommunityStage(body);
    final responseMap = jsonDecode(response.body);
    showToast(responseMap["message"]);
    if (responseMap["success"]) {
      setState(() {
        communityDetail = null;
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
