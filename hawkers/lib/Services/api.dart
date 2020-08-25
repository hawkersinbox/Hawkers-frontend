import 'package:flutter/material.dart';

import 'dart:convert';


import 'package:http/http.dart' as http;
class RestApi {
  RestApi();

  Future<http.Response> register(String body) async {
    try {
      String url= "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/auth/v0/signUp";
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
      String url="https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/auth/v0/signIn";
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
  Future<http.Response> getOtp(String body) async {
    try {
      print("body: $body");
      final response = await http.post(
        '${"https://www.getpostman.com/collections/3be04fa0e0ce12522358"}auth/v0/otpVerify',
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
      String url= "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/community";
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
    String url="https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/product";
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
  Future<http.Response> getProduct() async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/product";
      final response = await http.get(url,
          headers: <String, String>{'content-type': "application/json"});
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
      final response = await http.get(url,
          headers: <String, String>{'content-type': "application/json"});
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }
  Future<http.Response> getCategory() async {
    try {
      String url =
          "https://zzsa82b4p3.execute-api.ap-south-1.amazonaws.com/prod/v0/category";
      final response = await http.get(url,
          headers: <String, String>{'content-type': "application/json"});
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}