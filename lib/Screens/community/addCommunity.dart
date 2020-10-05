import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hawkers/Services/api.dart';

class AddCommunity extends StatefulWidget {
  static const routeName = '/Add-Community';
  @override
  _AddCommunityState createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
  RestApi restApi = RestApi();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _communitynameController = new TextEditingController();
  TextEditingController _alternateMobileController =
      new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _streetaddressController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _pincodeController = new TextEditingController();
  TextEditingController _availableDaysController = new TextEditingController();
  TextEditingController _maxStallCountController = new TextEditingController();

  String _mobile;
  String _email;
  String _communityname;
  String _alternateMobile;
  String _city;
  String _streetAddress;
  String _state;
  String _pincode;
  String _availableDays;
  String _maxShopCount;
  bool loading = false;
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  _addCommunity() async {
    _mobile = _mobileController.text;
    _communityname = _communitynameController.text;
    _alternateMobile = _alternateMobileController.text;
    _email = _emailController.text;
    _state = _stateController.text;
    _city = _cityController.text;
    _pincode = _pincodeController.text;
    _streetAddress = _streetaddressController.text;
    _maxShopCount = _maxStallCountController.text;
    _availableDays = _availableDaysController.text;

    if (_mobile != '' &&
        _email != '' &&
        _communityname != '' &&
        _alternateMobile != '' &&
        _city != '' &&
        _state != '' &&
        _streetAddress != '' &&
        _pincode != '' &&
        _availableDays != '' &&
        _maxShopCount != '') {
      String body = json.encode({
        "type": _communityname,
        "contact_number": _mobile,
        "alternate_contact_numbr": _alternateMobile,
        "email": _email,
        "street_address": _streetAddress,
        "city": _city,
        "state": _state,
        "pincode": _pincode,
        "available_days": _availableDays,
        "max_shop_count": _maxShopCount
      });
      setState(() {
        loading = true;
      });

      var responseData;
      try {
        final response = await restApi.addCommunity(body);
        responseData = jsonDecode(response.body);
      } catch (e) {}
      setState(() {
        loading = false;
      });
      if (responseData["success"]) {
        _mobileController.clear();
        _communitynameController.clear();
        _alternateMobileController.clear();
        _emailController.clear();
        _cityController.clear();
        _stateController.clear();
        _streetaddressController.clear();
        _pincodeController.clear();
        _maxStallCountController.clear();
        _availableDaysController.clear();
        final snackBar = SnackBar(content: Text('${responseData["message"]}'));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(content: Text('${responseData["message"]}'));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        //  Global.showErrorDialog(context, "", responseData["message"]);
      }
    } else {
      final snackBar = SnackBar(content: Text('Invalid Input'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Add Community',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [
                Field('Community name*', _communitynameController),
                SizedBox(
                  height: 20,
                ),
                NumField('Mobile Number*', _mobileController),
                SizedBox(
                  height: 20,
                ),
                NumField('Alternate Mobile Number', _alternateMobileController),
                SizedBox(
                  height: 20,
                ),
                Field('Email Address', _emailController),
                SizedBox(
                  height: 20,
                ),
                Field('Street Address', _streetaddressController),
                SizedBox(
                  height: 20,
                ),
                Place('City*', _cityController),
                SizedBox(
                  height: 20,
                ),
                Place('State*', _stateController),
                SizedBox(
                  height: 20,
                ),
                NumField('Pincode*', _pincodeController),
                SizedBox(
                  height: 20,
                ),
                NumField('Available Days*', _availableDaysController),
                SizedBox(
                  height: 20,
                ),
                NumField('Max Stall Count*', _maxStallCountController),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on,
                          size: 30,
                        )),
                    Text('Add Location',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            decoration: TextDecoration.underline)),
                    //  Icon(Icons.phot)
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: SizedBox(
                    height: 45,
                    // width:ScreenUtil().setWidth(700),
                    child: RaisedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _addCommunity();
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
              ],
            )),
          ),
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
              padding: const EdgeInsets.all(4.0),
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
            )),
      ],
    ));
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
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 21),
                //     color:Colors.grey,

                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            )),
      ],
    ));
  }

  Widget Place(String name, TextEditingController controller) {
    return Container(
//height: 35,
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
        Stack(
          children: [
            Container(
                height: 45,
                decoration: BoxDecoration(
                    //  color: Colors.black12,
                    border: Border.all(color: Colors.black, width: 0),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    autofocus: true,
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
//                Positioned(
//                  top: 9,
//                  right: 2,
//                  child: Container(
//                    height: 34,
//                    decoration: BoxDecoration(
//                        color: Colors.black12,
//                        border: Border.all(color: Colors.black, width: 2),
//                        borderRadius: BorderRadius.circular(4)),
//                    child:
//                    Icon(Icons.arrow_drop_down, color: Colors.black, size: 25),
//                  ),
//                )
          ],
        ),
      ],
    ));
  }
}
