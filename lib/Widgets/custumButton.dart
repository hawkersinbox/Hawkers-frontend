import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustumButton extends StatelessWidget {
  final Function onTap;
  final bool isLoading;
  final title;

  const CustumButton(
      {Key key, this.onTap, @required this.isLoading, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((3))),
        color: Colors.lightGreen,
        child: isLoading
            ? SpinKitCircle(
                color: Colors.white,
                size: 25,
              )
            : Text(
                title ?? '',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
      ),
    );
  }
}
