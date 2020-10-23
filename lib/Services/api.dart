import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestApi {
  RestApi();

  final String BaseUrl =
      "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod";

  Future<Response> register(String body) async {
    try {
      String url = BaseUrl + "/auth/v0/signUp";
      final response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
        },
      );

      print("Registration Body: ${body.toString()}");
      print("Registration Response: ${response.toString()}");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> login(String body) async {
    try {
      String url = BaseUrl + "/auth/v0/signIn";
      final response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
        },
      );

      print("SignIn Body: ${body.toString()}");
      print("SignIn Response: ${response.toString()}");
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

      final response =
          await http.post(url, body: body, headers: requestHeaders);

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
      String url = BaseUrl + "/v0/product";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.get(url, headers: requestHeaders);

      print("GetProducts response: ${response.body.toString()}");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getCategory(String access_token) async {
    try {
      String url = BaseUrl + "/v0/category";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.get(url, headers: requestHeaders);

      print("HeadersMap: ${requestHeaders.toString()}");
      print("Get Categories Response: ${response.toString()}");

      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getSubCategory(id, String access_token) async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/subcategoryofCategory/$id";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };
      final response = await http.get(url, headers: requestHeaders);
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

      final response =
          await http.post(url, body: body, headers: requestHeaders);

      print("Add Product Map: ${requestHeaders.toString()}");
      print("Add Product Response: ${response.body.toString()}");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> updateRequestStage(body) async {
    try {
      final headers = await getHeader();
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/updateRequestStage";
      final response = await http.put(url, body: body, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> updateCommunityStage(body) async {
    try {
      final headers = await getHeader();
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/updateCommunityStage";
      final response = await http.put(url, body: body, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getCommunitybyID(id) async {
    try {
      final headers = await getHeader();
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/community/$id";
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getsalesRequestbyID(id) async {
    try {
      final headers = await getHeader();
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/request/$id";
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> salesRequest() async {
    try {
      final headers = await getHeader();
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/request";
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> salesRequestbystage(String stage) async {
    try {
      final headers = await getHeader();
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/requestbystage/$stage";
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getCommunity() async {
    try {
      final headers = await getHeader();
      String url = BaseUrl + "/v0/community";
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> createPayment(String body) async {
    try {
      final headers = await getHeader();
      String url = BaseUrl + "/v0/payment";
      final response = await http.post(url, body: body, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> getCommunityByStage(String stage) async {
    try {
      final headers = await getHeader();
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/getCommunityByStage/$stage";
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> addUser(String access_token, String body) async {
    try {
      String url = BaseUrl + "/v0/user";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response =
          await http.post(url, body: body, headers: requestHeaders);

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
      String url = BaseUrl + "/v0/myAccount";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response = await http.get(url, headers: requestHeaders);

      print("HeadersMap: ${requestHeaders.toString()}");
      print("Add User Response: ${response.toString()}");

      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> createSalesRequest(String access_token, String body) async {
    try {
      String url = BaseUrl + "/v0/request";

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer " + access_token
      };

      final response =
          await http.post(url, body: body, headers: requestHeaders);

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

      final response = await http.get(URL, headers: requestHeaders);

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

      final response = await http.put(URL, body: body, headers: requestHeaders);

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

Future<Map<String, String>> getHeader() async {
  final _prefs = await SharedPreferences.getInstance();
  final accessToken = _prefs.getString("user_access_token");
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    HttpHeaders.authorizationHeader: "Bearer " + accessToken
  };
  return requestHeaders;
}
