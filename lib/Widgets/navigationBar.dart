import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        child: Column(
          children: [
            Divider(height: 10,color:Colors.grey,
              thickness: 1,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Icon(Icons.add,
                    color:Colors.black,
                    size:40),

                Icon(Icons.home,
                    color:Colors.black,
                    size:40),
                Icon(Icons.person_outline,
                    color:Colors.black,
                    size:40),

              ],
            )
          ],
        ),
      ),
    );;
  }
}
