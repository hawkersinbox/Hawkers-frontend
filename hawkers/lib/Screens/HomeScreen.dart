import 'package:flutter/material.dart';
import 'package:hawkers/Screens/addProducts.dart';
import 'package:hawkers/Screens/communities.dart';
import 'package:hawkers/Widgets/navigationBar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        title:Text('Hawkers',style:TextStyle(
            color:Colors.lightGreen,
            fontSize: 26,
            fontWeight: FontWeight.w600
        )),
          centerTitle: true,
          backgroundColor: Colors.white,
         // elevation: 0,

        ),

      bottomNavigationBar:NavigationBar(),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // SizedBox(height: 10,),
              Text('UPCOMING',style:TextStyle(
                fontSize:16,
                fontWeight: FontWeight.bold,
                color:Colors.grey

              )),
              SizedBox(height: 5,),
              Container(
                height: 70,

                child: ListView.builder(
                itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => Card(
                    elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    child:Container(
                      height:70,
                      width: 150,
                      child: Column(
                        children: [
                          Text('Request',style: TextStyle(

                            fontSize: 18,
                           // fontWeight: FontWeight.bold,
                            color:Colors.black,
                          ),),
                          SizedBox(height: 4,),
                          Text('123',style: TextStyle(

                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color:Colors.grey,
                          ),),

                        ],
                      ),
                    )
                  ),
                ),
              ),
              Divider(height: 40,color:Colors.black,thickness: 1,),
             // SizedBox(height: 20,),
              Text('COLLECTIONS',style:TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.bold,
                  color:Colors.grey

              )),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: card('Sales Request')),
                  Expanded(
                    child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(Communities.routeName);
                        },
                        child: card('Communities')),
                  ),
               //   card('Products'),


             ]
      ),

              Row(

                  children: [
                    Expanded(child: card('Approval')),

                    Expanded(child: card('Add User')),

                   // card('Add Payment'),


                    
                  ]
              ),
              Row(
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(AddProducts.routeName);
                          },
                          child: card('Products')),
                    ),
                    Expanded(child: card('Add Payment')),
                    // card('Add Payment'),



                  ]
              ),
          ]
    )
      )
    )
    );

  }


  Widget card(String name){
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        child:Container(
          height:70,
         // width: 177,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,style: TextStyle(

                fontSize: 18,
                // fontWeight: FontWeight.bold,
                color:Colors.black,
              ),),
            ],
          ),
        )
    );
  }
}
