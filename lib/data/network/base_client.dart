import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:notey_app/data/network/api_exception.dart';

class ClientBase {
  int timeOut = 30;

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http
          .get(uri, headers: headers)
          .timeout(Duration(seconds: timeOut));
      return _processingException(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotResponseException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Uri uri = Uri.parse(url);
    try {
      var response = await http
          .post(uri, headers: headers, body: body)
          .timeout(Duration(seconds: timeOut));
      return _processingException(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotResponseException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> put(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Uri uri = Uri.parse(url);
    try {
      var response = await http
          .put(uri, headers: headers, body: body)
          .timeout(Duration(seconds: timeOut));
      return _processingException(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotResponseException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> delete(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Uri uri = Uri.parse(url);
    try {
      var response = await http
          .delete(uri, headers: headers, body: body)
          .timeout(Duration(seconds: timeOut));
      return _processingException(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotResponseException(
          'API not responded in time', uri.toString());
    }catch(e){
      throw FetchDataException('message',uri.toString());
    }
  }

  dynamic _processingException(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(jsonDecode(response.body)["message"],
            response.request?.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code ', response.request!.url.toString());
    }
  }
}
