import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Models/communityModel.dart' as Model;
import 'package:hawkers/Provider/getCommunity.dart';
import 'package:hawkers/Widgets/navigationBar.dart';
import 'package:provider/provider.dart';
class Communities extends StatefulWidget {
  static const routeName = '/Community';
  final Model.CommunityResponse communityResponse;
  final city;


  const Communities({Key key, this.communityResponse, this.city}) : super(key: key);
  @override
  _CommunitiesState createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  bool isLoading = true;
  @override
  void initState() {
    getCommunity();

    super.initState();
  }

  getCommunity() async {
    await Provider.of<GetCommunity>(context, listen: false)
        .getCommunity(widget.city.toString());

    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Communities',style:TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color:Colors.black,

        )),
        backgroundColor: Colors.white,
        centerTitle: true,

        ),
      bottomNavigationBar: NavigationBar(),


      body:isLoading
          ? Center(
        child: CircularProgressIndicator(),
      ): Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          alignment: AlignmentDirectional.center,
    child: Consumer<GetCommunity>(
    builder: (ctx, data, _)=>Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            Expanded(
              child: ListView.builder(
                itemCount: data.communityResponse.length,
                itemBuilder: (ctx, index) => Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.communityResponse[index].city,

                       style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color:Colors.black,
                          size: 22,
                        )
                      ],
                    ),
                    Divider(height: 30,
                      color: Colors.grey,
                      thickness: 1,),
                  ],
                ),
                ),
              ),

            ),
              Container(
                height: 45,
                // width: 400,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(3)

                ),
                child: Text('Add Community',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),


            ],
          )
        ),
      ),
      )
    );
  }
}
