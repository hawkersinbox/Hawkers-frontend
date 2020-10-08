import 'package:flutter/material.dart';
import 'package:hawkers/Screens/HomeScreen.dart';

class Approval extends StatefulWidget {
  static const routeName = '/Approval';
  @override
  _ApprovalState createState() => _ApprovalState();
}

class _ApprovalState extends State<Approval> {
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      nextScreen();
    });
    super.initState();
  }

  nextScreen() async {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
      ),
     body: Container(
       alignment: Alignment.center,

       child:Container(
         height: 170,
         width: 300,
         decoration: BoxDecoration(
           border: Border.all(color:Colors.black,width: 2),
           borderRadius: BorderRadius.circular(10)
         ),
         child: Column(

           children: [
             Text('Waiting Approval',
             style:TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.w600,
             )),
             SizedBox(height: 18,),
             Text('Login Request Sent For',
                 style:TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w600,
                 )),
             Text('approval,will be notified once',
                 style:TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w600,
                 )),
             Text('approved!!',
                 style:TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w600,
                 )),
             SizedBox(height: 12,),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: Text('Okay',style:
                   TextStyle(
                     fontSize: 20,
                     color:Colors.blueAccent,
                       decoration: TextDecoration.underline
                   )),
                 ),
               ],
             )

           ],
         ),
       )
     )
    );
  }
}
