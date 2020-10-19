

import 'package:hawkers/SQLite/Model.dart';

class AppUser extends Model {

  static String table = 'user_table';

  int id;
  String firstName;
  String lastName;
  String emailID;
  String mobileNumber;
  String userCity;
  String userState;
  String userStreetOne;
  String userPinCode;


  AppUser({this.id,
    this.firstName,
    this.lastName,
    this.emailID,
    this.mobileNumber,
    this.userCity,
    this.userState,
    this.userStreetOne,
    this.userPinCode,
  });

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'first_name': firstName,
      'last_name': lastName,
      'email_ID': emailID,
      'mobile_number' : mobileNumber,
      'user_city' : userCity,
      'user_state' : userState,
      'user_street_one' : userStreetOne,
      'user_pin_code' : userPinCode
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static AppUser fromMap(Map<String, dynamic> map) {

    return AppUser(
        id: map['id'],
        firstName: map['first_name'],
        lastName: map['last_name'],
        emailID: map['email_ID'],
        mobileNumber: map['mobile_number'],
        userCity: map['user_city'],
        userState: map['user_state'],
        userStreetOne: map['user_street_one'],
        userPinCode: map['user_pin_code']
    );
  }
}