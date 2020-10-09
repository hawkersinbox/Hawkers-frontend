
class UserInfoClass {
  bool success;
  String message;
  Response response;

  UserInfoClass({this.success, this.message, this.response});

  UserInfoClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}

class Response {
  String streetAddress1;
  String city;
  String state;
  String pincode;
  String firstName;
  String lastName;
  String mobile;
  String email;

  Response(
      {this.streetAddress1,
        this.city,
        this.state,
        this.pincode,
        this.firstName,
        this.lastName,
        this.mobile,
        this.email});

  Response.fromJson(Map<String, dynamic> json) {
    streetAddress1 = json['street_address1'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street_address1'] = this.streetAddress1;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}