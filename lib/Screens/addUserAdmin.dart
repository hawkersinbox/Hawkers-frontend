import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

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
                Field("First Name*",),
                SizedBox(
                  height: 20,
                ),
                Field('Last Name*', ),
                SizedBox(height: 20),
                NumField('Mobile Number*', ),
                SizedBox(
                  height: 20,
                ),
                Field('Email Address', ),
                SizedBox(
                  height: 20,
                ),
                Field('Street Address',),
                SizedBox(
                  height: 20,
                ),
                Field('City*', ),
                SizedBox(
                  height: 20,
                ),
                Field('State*', ),
                SizedBox(
                  height: 20,
                ),
                NumField('Pincode*',),
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
                            child: Text("Sales"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Marketing"),
                            value: 2,
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
    //  TextEditingController controller,
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
                 //   controller: controller,
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
  //    TextEditingController controller,
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
            //    controller: controller,
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
}
