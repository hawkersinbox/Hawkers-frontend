import 'package:flutter/material.dart';
import 'package:hawkers/Models/communityModel.dart';
import 'package:hawkers/Provider/approvalCommunity.dart';
import 'package:hawkers/Screens/adminApproval/adminCommunityApproval.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class AllCommunity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AprovalCommunity>(
      builder: (ctx, model, _) => ListView.separated(
        itemCount: model.displayAllCommunity.length,
        separatorBuilder: (ctx, index) => Divider(
          height: 10,
          color: Colors.black,
          thickness: 2,
        ),
        itemBuilder: (ctx, index) =>
            CommunityCard(community: model.displayAllCommunity[index]),
      ),
    );
  }
}

class InprogressCommunity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AprovalCommunity>(
      builder: (ctx, model, _) => ListView.separated(
        itemCount: model.displayInprogressCommunity.length,
        separatorBuilder: (ctx, index) => Divider(
          height: 10,
          color: Colors.black,
          thickness: 2,
        ),
        itemBuilder: (ctx, index) =>
            CommunityCard(community: model.displayInprogressCommunity[index]),
      ),
    );
  }
}

class CompleteCommunity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AprovalCommunity>(
      builder: (ctx, model, _) => ListView.separated(
        itemCount: model.displayCompletedCommunity.length,
        separatorBuilder: (ctx, index) => Divider(
          height: 10,
          color: Colors.black,
          thickness: 2,
        ),
        itemBuilder: (ctx, index) =>
            CommunityCard(community: model.displayCompletedCommunity[index]),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final Community community;

  const CommunityCard({Key key, @required this.community}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AdminCommunityApproval(
                      id: community.id,
                    )));
      },
      child: Row(
        children: [
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  community?.id.toString() ?? '',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  Jiffy(community.createdAt).format("MMM do yy"),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Type:${community?.type ?? ''}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  community?.stage ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.lightGreen),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 25,
          )
        ],
      ),
    );
  }
}
