import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

class ProductReview extends StatefulWidget {
  @override
  _ProductReviewState createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Food',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  child: Image.asset('',),
                ),
                Divider(
                  height: 30, color: Colors.black,thickness: 1,
                ),
                label('Category'),
                SizedBox(height: 5,),
                subLabel('Groceries'),
                SizedBox(height: 15,),
                label('Sub Category'),
                SizedBox(height: 5,),
                subLabel('Grains'),
                SizedBox(height: 15,),
                label('Product'),
                SizedBox(height: 5,),
                subLabel('Rice'),
                SizedBox(height: 15,),
                label('Price Range'),
                SizedBox(height: 5,),
                subLabel('Rs1-Rs100'),
                SizedBox(height: 15,),
                label('MFG/Farm Location'),
                SizedBox(height: 5,),
                subLabel('Chirala'),
                SizedBox(height: 15,),
                label('Comments'),
                SizedBox(height: 5,),
                subLabel('Good quality rice'),




              ],
            ),
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
}
