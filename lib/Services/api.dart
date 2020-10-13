import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RestApi {
  RestApi();

  final String BaseUrl = "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod";


  Future<Response> register(String body) async {
    try {
      String url =
          BaseUrl + "/auth/v0/signUp";
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

  Future<Response> login(String body) async {
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

  Future<Response> otpVerify(String body) async {
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

  Future<Response> addCommunity(String body, String access_token) async {
    try {
      print("body: $body");
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/community";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.post(
        url,
        body: body,
        headers: requestHeaders
      );

      print("Add Communities Response: ${response.toString()}");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> product(String body) async {
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

  Future<Response> getProduct(String access_token) async {
    try {
      String url =
          BaseUrl + "/v0/product";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.get(url,
          headers: requestHeaders
      );

      print("GetProducts response: ${response.body.toString()}");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getCommunity(String access_token) async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/community";
      print(url);

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.get(
        url,
        headers: requestHeaders
      );
      print(response.body);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getCategory(String access_token) async {
    try {
      String url =
         BaseUrl +  "/v0/category";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.get(url,
          headers:requestHeaders
      );

      print("HeadersMap: ${requestHeaders.toString()}");
      print("Get Categories Response: ${response.toString()}");

      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getSubCategory(String body, String access_token) async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/subcategory";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.get(
          url,
          headers: requestHeaders
      );
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> addProduct(String body, String access_token) async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/product";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.post(url,
          body: body,
          headers: requestHeaders
      );

      print("Add Product Map: ${requestHeaders.toString()}");
      print("Add Product Response: ${response.body.toString()}");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> salesRequest() async {
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



  Future<Response> addUser(String access_token, String body) async {

    try {
      String url =
          BaseUrl + "/v0/user";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.post(url,
          body: body,
          headers:requestHeaders
      );

      print("HeadersMap: ${requestHeaders.toString()}");
      print("Add User Response: ${response.toString()}");

      return response;
    } catch (e) {
      print(e);
      throw e;
    }

  }

  Future<Response> getUserInfo(String access_token) async {
    try {
      String url =
          BaseUrl + "/v0/myAccount";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.get(
          url,
          headers:requestHeaders
      );

      print("HeadersMap: ${requestHeaders.toString()}");
      print("Add User Response: ${response.toString()}");

      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }


  Future<Response> createSalesRequest(
      String access_token,
      String body
      ) async {
    try {
      String url =
          BaseUrl + "/v0/request";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.post(
          url,
          body: body,
          headers:requestHeaders
      );

      print("HeadersMap: ${requestHeaders.toString()}");
      print("Create Request Body: $body");
      print("Add User Response: ${response.toString()}");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }


  Future<Response> getSalesRequests(String access_token) async {
    String URL = BaseUrl + "/v0/openrequest";

    try {

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      HttpHeaders.authorizationHeader: "Bearer " + access_token
    };

    final response = await http.get(
        URL,
        headers:requestHeaders
    );

    print("HeadersMap: ${requestHeaders.toString()}");
    print("Add User Response: ${response.toString()}");

    return response;
  } catch (e) {
  print(e);
  throw e;
  }


  }


  Future<Response> updateUserProfiel(String access_token, String body) async {
    String URL = BaseUrl + "/v0/updateUserProfile";

    try {

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.put(
          URL,
          body: body,
          headers:requestHeaders
      );

      print("Update User Profile Body: $body");
      print("Update User Profile HeadersMap: ${requestHeaders.toString()}");
      print("Update User Profile Response: ${response.toString()}");

      return response;
    } catch (e) {
      print(e);
      throw e;
    }


  }



}
