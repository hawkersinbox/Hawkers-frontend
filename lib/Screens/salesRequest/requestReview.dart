import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

class RequestReview extends StatefulWidget {
  @override
  _RequestReviewState createState() => _RequestReviewState();
}

class _RequestReviewState extends State<RequestReview> {
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Request ID',
                      style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(width:20),
                    Text('REG15352',
                      style:TextStyle(
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
                    Text('Status',
                      style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(width:55),
                    Text('INPROGRESS',
                      style:TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.w600,
                          color: Colors.lightGreen),
                    ),

                  ],
                ),
                Divider(
                  height: 20, color: Colors.black,thickness: 1,
                ),
                SizedBox(height: 10,),

                label('Product Name'),
                SizedBox(height: 5,),
                subLabel('Rice'),
                SizedBox(height: 15,),
                label('Booking Date'),
                SizedBox(height: 5,),
                subLabel('15/08/2020'),
                SizedBox(height: 15,),
                label('Payment ID'),
                SizedBox(height: 5,),
                subLabel('RE8778763'),
                SizedBox(height: 15,),
                label('Alternate Mobile'),
                SizedBox(height: 5,),
                subLabel('9156567829'),
                SizedBox(height: 15,),
                label('Comments'),
                SizedBox(height: 5,),
                subLabel('Want to sell xyz on Saturday'),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget label( String name){
    return Text(
      name,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black),
    );
  }
  Widget subLabel(String sub){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10,),
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
