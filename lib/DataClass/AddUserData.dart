

class AddUseData {
  bool success;
  String message;
  Response response;

  AddUseData({this.success, this.message, this.response});

  AddUseData.fromJson(Map<String, dynamic> json) {
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
  int id;
  String firstName;
  String lastName;
  Null profilePicUrl;
  String role;
  String mobile;
  Null alternateMobile;
  String email;
  int addressId;
  Null lastLoginTime;
  Null comment;
  String status;
  String rating;
  String createdAt;
  String updatedAt;
  int createdBy;
  Null updatedBy;

  Response(
      {this.id,
        this.firstName,
        this.lastName,
        this.profilePicUrl,
        this.role,
        this.mobile,
        this.alternateMobile,
        this.email,
        this.addressId,
        this.lastLoginTime,
        this.comment,
        this.status,
        this.rating,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePicUrl = json['profile_pic_url'];
    role = json['role'];
    mobile = json['mobile'];
    alternateMobile = json['alternate_mobile'];
    email = json['email'];
    addressId = json['address_id'];
    lastLoginTime = json['last_login_time'];
    comment = json['comment'];
    status = json['status'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_pic_url'] = this.profilePicUrl;
    data['role'] = this.role;
    data['mobile'] = this.mobile;
    data['alternate_mobile'] = this.alternateMobile;
    data['email'] = this.email;
    data['address_id'] = this.addressId;
    data['last_login_time'] = this.lastLoginTime;
    data['comment'] = this.comment;
    data['status'] = this.status;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}