import 'package:http/http.dart' as http;

class RestApi {
  RestApi();

  final String BaseUrl = "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/";

  Future<http.Response> register(String body) async {
    try {
      String url =
          BaseUrl + "auth/v0/signUp";
      final response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
        },
      );
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> login(String body) async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/auth/v0/signIn";
      final response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
        },
      );
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> otpVerify(String body) async {
    try {
      print("body: $body");
      final response = await http.post(
        'https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/auth/v0/otpVerify',
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
        },
      );
      print(response.body);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> addCommunity(String body) async {
    try {
      print("body: $body");
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/community";
      final response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
        },
      );
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> product(String body) async {
    try {
      print("body: $body");
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/product";
      final response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
        },
      );

      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> getProduct(String access_token) async {
    try {
      String url =
          BaseUrl + "v0/product";
      final response = await http.get(url,
          headers: <String, String>{
        'content-type': "application/json",
            'Bearer' : access_token
      });

      print(response.body);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> getCommunity() async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/community";
      print(url);
      final response = await http.get(
        url,
      );
      print(response.body);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> getCategory(String access_token) async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/category";
      final response = await http.get(url,
          headers: <String, String>{
        'content-type': "application/json",
            'Bearer': access_token

      });
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> getSubCategory(String body) async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/subcategory";
      final response = await http.get(url,
          headers: <String, String>{'content-type': "application/json"});
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> addProduct(String body) async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/product";
      final response = await http.post(url,
          body: body,
          headers: <String, String>{'content-type': "application/json"});
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> salesRequest() async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/request";
      final response = await http.get(url,
          headers: <String, String>{'content-type': "application/json"});
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
