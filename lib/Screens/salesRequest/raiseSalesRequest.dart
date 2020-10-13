import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hawkers/DataClass/createSalesRequest.dart';
import 'package:hawkers/Screens/salesRequest/requestReview.dart';
import 'package:hawkers/Services/api.dart';
import 'package:intl/intl.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

RestApi _restApi = RestApi();
TextEditingController _addCommentController = new TextEditingController();

class RaiseSales extends StatefulWidget {
  @override
  _RaiseSalesState createState() => _RaiseSalesState();
}

class _RaiseSalesState extends State<RaiseSales> {
  DateTime _dateTime;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery,);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    int _value = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Request',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar:NavigationBar() ,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                ),
                SizedBox(height: 10,),
                Text('Address',
                style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                ),
                SizedBox(height: 4,),
                Container(
                  width: 270,
                  child: Text('Empire Medows, Miaypur, Hyderabad, 503023',
                    style:TextStyle(
                        fontSize: 17,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Available days',
                      style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(width:7,),
                    Text('Sat,Sun',
                      style:TextStyle(
                          fontSize: 17,
                          //fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Rent',
                      style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(width:4,),
                    Text('3000/-(per day)',
                      style:TextStyle(
                          fontSize: 17,
                          //fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(width:6,),

                    Text('Fee',
                      style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(width:7,),
                    Text('300',
                      style:TextStyle(
                          fontSize: 17,
                          //fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),

                  ],
                ),
                Divider(
                  height: 20, color: Colors.black,thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,30,0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Product Name*',
                          style:TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //   color: Colors.white10,
                              border: Border.all(color: Colors.black, width: 0),
                              borderRadius: BorderRadius.circular(3)),
                          child: TextField(
                            // keyboardType: TextInputType.number,
                            // controller: controller,
                            textAlign: TextAlign.start,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black, fontSize: 19),
                            //     color:Colors.grey,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Booking Date*',
                          style:TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  //   color: Colors.white10,
                                    border: Border.all(color: Colors.black, width: 0),
                                    borderRadius: BorderRadius.circular(3)),
                                child:  Text(
                                    _dateTime == null
                                        ? 'Select Date'
                                        : DateFormat('dd/MM/yyyy')
                                        .format(_dateTime)
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19
                                   //   fontFamily: 'Roboto',
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2019),
                                  lastDate: DateTime(2022),
                                ).then((date) {
                                  setState(() {
                                    _dateTime = date;
                                  });
                                });

                              },
                              child: Icon(
                                Icons.calendar_today,
                                size: 37,
                                color: Colors.black,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Text('Payment ID',
                          style:TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //   color: Colors.white10,
                              border: Border.all(color: Colors.black, width: 0),
                              borderRadius: BorderRadius.circular(3)),
                          child:  Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                             // keyboardType: TextInputType.number,
                             // controller: controller,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 19),
                              //     color:Colors.grey,

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              ),
                            ),
                          ),
                            
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Text('Alternate Mobile ',
                          style:TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //   color: Colors.white10,
                              border: Border.all(color: Colors.black, width: 0),
                              borderRadius: BorderRadius.circular(3)),
                          child:  Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                               keyboardType: TextInputType.number,
                              // controller: controller,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 19),
                              //     color:Colors.grey,

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              ),
                            ),
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Text('Comments',
                          style:TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //   color: Colors.white10,
                              border: Border.all(color: Colors.black, width: 0),
                              borderRadius: BorderRadius.circular(3)),
                          child:  Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextField(
                              // keyboardType: TextInputType.number,
                              controller: _addCommentController,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 19),
                              //     color:Colors.grey,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              ),
                            ),
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),

                        InkWell(
                          onTap: getImage,
                          child: Center(
                            child: Icon(Icons.file_upload,
                                size: 50, color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text('Upload Image',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            child: SizedBox(
                              height: 45,
                              // width:ScreenUtil().setWidth(700),
                              child: RaisedButton(
                                onPressed: () {
                                  raiseSalesRequest(_image);
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>RequestReview()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular((3))),
                                color: Colors.lightGreen,
                                child: Text(
                                  'Submit',
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
                )

              ],
            ),
          ),
        ),
      ),

    );
  }

  void raiseSalesRequest(File _pickedImageFilePath) {

    String comment = _addCommentController.text.toString();
    print("Comment: $comment");
    _addCommentController.clear();

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    _prefs.then((SharedPreferences sharedPreferences) {
      String accessToken = sharedPreferences.getString("access_token");
      print("access_token: $accessToken");
      String body = json.encode({
        "seller_id": 1,
        "product_id": 1,
        "community_id": 1,
        "image_url": _pickedImageFilePath.toString(),
        "seller_comment": comment
      });
      var response = _restApi.createSalesRequest(accessToken, body);
      response.then((value) {
        var responseData = jsonDecode(value.body);
        print("Response String: ${responseData.toString()}");
        Map<String, dynamic> _map = json.decode(responseData) as Map;
        print("Map String: ${_map.toString()}");

        var createSalesRequest = CreateSalesRequest.fromJson(_map);

        if (createSalesRequest.success){
          print("Create sales request message : ${createSalesRequest.message}");
          // TODO Create Sales Request ...

        }else {
          print("Create sales request : ${createSalesRequest.success.toString()}");
        }

      })
      .whenComplete(() {
        print("Complete!");
      })
      .catchError((e){
        print("Error: ${e.toString()}");
      });

    })
        .whenComplete(() {
      print("Complete!");
    })
        .catchError((error){
      print("Error: ${error.toString()}");
    });


  }
}
