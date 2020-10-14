
class UpdateUserProfileClass {
  String mobile;
  String firstName;
  String lastName;
  String email;
  String streetAddress1;
  String city;
  String state;
  String pincode;

  UpdateUserProfileClass(
      {this.mobile,
        this.firstName,
        this.lastName,
        this.email,
        this.streetAddress1,
        this.city,
        this.state,
        this.pincode});

  UpdateUserProfileClass.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    streetAddress1 = json['street_address1'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['street_address1'] = this.streetAddress1;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }
}