
class CreateSalesRequest {
  bool success;
  String message;
  Response response;

  CreateSalesRequest({this.success, this.message, this.response});

  CreateSalesRequest.fromJson(Map<String, dynamic> json) {
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
  int sellerId;
  int productId;
  int communityId;
  Null imageUrl;
  String status;
  Null processedById;
  String sellerComment;
  Null adminComment;
  String createdAt;
  String updatedAt;
  Null createdBy;
  Null updatedBy;

  Response(
      {this.id,
        this.sellerId,
        this.productId,
        this.communityId,
        this.imageUrl,
        this.status,
        this.processedById,
        this.sellerComment,
        this.adminComment,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    productId = json['product_id'];
    communityId = json['community_id'];
    imageUrl = json['image_url'];
    status = json['status'];
    processedById = json['processed_by_id'];
    sellerComment = json['seller_comment'];
    adminComment = json['admin_comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['product_id'] = this.productId;
    data['community_id'] = this.communityId;
    data['image_url'] = this.imageUrl;
    data['status'] = this.status;
    data['processed_by_id'] = this.processedById;
    data['seller_comment'] = this.sellerComment;
    data['admin_comment'] = this.adminComment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}