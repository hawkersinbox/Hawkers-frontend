import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hawkers/DataClass/AddUserData.dart';
import 'package:hawkers/Services/api.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

RestApi _restApi = RestApi();
TextEditingController _firstNameController = new TextEditingController();
TextEditingController _lastNameController = new TextEditingController();
TextEditingController _mobileNoController = new TextEditingController();
TextEditingController _emailController = new TextEditingController();
TextEditingController _streeNameController = new TextEditingController();
TextEditingController _stateController = new TextEditingController();
TextEditingController _cityController = new TextEditingController();
TextEditingController _pinCodeController = new TextEditingController();
TextEditingController _roleController = new TextEditingController();



class AddUserAdmin extends StatefulWidget {
  @override
  _AddUserAdminState createState() => _AddUserAdminState();
}

class _AddUserAdminState extends State<AddUserAdmin> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add User',
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
                Field("First Name*", _firstNameController),
                SizedBox(
                  height: 20,
                ),
                Field('Last Name*', _lastNameController),
                SizedBox(height: 20),
                NumField('Mobile Number*', _mobileNoController),
                SizedBox(
                  height: 20,
                ),
                Field('Email Address', _emailController),
                SizedBox(
                  height: 20,
                ),
                Field('Street Address', _streeNameController),
                SizedBox(
                  height: 20,
                ),
                Field('City*', _cityController),
                SizedBox(
                  height: 20,
                ),
                Field('State*', _stateController),
                SizedBox(
                  height: 20,
                ),
                NumField('Pincode*', _pinCodeController),
                SizedBox(
                  height: 20,
                ),
                Text('Role*',
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
                    padding: const EdgeInsets.only(left:4,),
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
                            child: Text("SELLER"),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("MARKETING"),
                            value: 1,
                          ),
                        //  DropdownMenuItem(child: Text("Noida"), value: 3),
                        ]
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    child: SizedBox(
                      height: 45,
                      // width:ScreenUtil().setWidth(700),
                      child: RaisedButton(
                        onPressed: () {
                          String userRole = getRole(_value);
                          print("UserRole: ${userRole.toString()}");
                          addUser(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              mobileNo: _mobileNoController.text,
                              emailID : _emailController.text,
                              streetAddressOne : _streeNameController.text,
                              city : _cityController.text,
                              state: _stateController.text,
                              pinCode : _pinCodeController.text,
                              role: userRole
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((3))),
                        color: Colors.lightGreen,
                        child: Text(
                          'Add User',
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
                    //     color:Colors.grey,

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
     TextEditingController _controller,
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
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
               controller: _controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 21),
                onChanged: (newValue){
                  print("NewValue: ${newValue.toString()}");
                },
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

  void addUser(
  {
    String firstName,
    String lastName,
    String mobileNo,
    String emailID,
    String streetAddressOne,
    String city,
    String state,
    String pinCode,
    String role
}
      ) {

    final body = jsonEncode({
      "first_name": firstName,
      "last_name": lastName,
      "mobile": mobileNo,
      "email": emailID,
      "street_address1": streetAddressOne,
      "city": city,
      "state": state,
      "pincode": pinCode,
      "role": role
    });

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    _prefs.then((SharedPreferences sharedPreferences) {
      String accessToken = sharedPreferences.getString("access_token");
      print("access_token: $accessToken");
      var response = _restApi.addUser(accessToken, body);
      response.then((value)  {
        String response = value.body.toString();
        print("Response String: $response}");
        Map<String, dynamic> _map = json.decode(response) as Map;
        print("Map String: ${_map.toString()}");
        var variable = new AddUseData.fromJson(_map);
        String firstName = variable.response.firstName;
        print(variable.response.toString());
        print("FirstName: $firstName");
      })
      .catchError((error){
        print("Error: ${error.toString()}");
      })
      .whenComplete(() {
        print("Complete!");
      });
      print("add user response: ${response.toString()}");

    })
        .whenComplete(() {
      print("Complete!");
    })
        .catchError((error){
      print("Error: ${error.toString()}");
    });
  }

  String getRole(int value) {
    switch (_value){
      case 0:
        return "Sales";
        break;
      case 1:
        return "Marketing";
        break;
    }
  }
}
