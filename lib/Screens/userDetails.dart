import 'package:flutter/material.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:hawkers/Widgets/userDetail.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List<userD> detail;

  @override
  void initState(){
    detail=userD.getUserDetail();
    super.initState();
  }
  DataTable dataBody() {
    return DataTable(

        columns: [
          DataColumn(
            label: Text('User Name', style: TextStyle(
                fontSize: 17,
                //   fontWeight: FontWeight.w600,
                color: Colors.lightGreen),
            ),
            numeric: false,


          ),
          DataColumn(
            label: Text('Role', style: TextStyle(
                fontSize: 17,
                //   fontWeight: FontWeight.w600,
                color: Colors.lightGreen),
            ),
            numeric: false,


          ),
          DataColumn(
            label: Text('Status', style: TextStyle(
                fontSize: 17,
                //   fontWeight: FontWeight.w600,
                color: Colors.lightGreen),
            ),
            numeric: false,


          ),
        ],
        rows: detail.map(
        (user)=>DataRow(
        cells: [
        DataCell(
    Text(user.UserName)
        ),
      DataCell(
          Text(user.Role)
      ),
      DataCell(
          Text(user.Status)
      ),
      ]
    )
    ).toList(),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('User Info',
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
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(child: dataBody()),
          ],
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
}
