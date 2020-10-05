

import 'package:flutter/cupertino.dart';

class MobileNumberProvider extends ChangeNotifier {

  String _mobileNumber;

  String get mobileNumber => _mobileNumber;

  void setMobileNumber(String userMobileNumber){
    this._mobileNumber = userMobileNumber;
    notifyListeners();
  }


}