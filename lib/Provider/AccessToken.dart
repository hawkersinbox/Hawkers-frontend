
import 'package:flutter/cupertino.dart';

class AccessTokenProvider extends ChangeNotifier {

  String _mAccessToken;

  String get mAccessToken => _mAccessToken;

  void setAccessToken(String access_token){
    this._mAccessToken = access_token;
    notifyListeners();
  }





}