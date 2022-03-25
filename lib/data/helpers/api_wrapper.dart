import 'dart:async';
import 'package:fetch_api_with_block/app/utils/strings/network_constants.dart';
import 'package:fetch_api_with_block/domain/domain.dart';
import 'package:http/http.dart' as http;

class ApiWrapper {
  Future<ResponseModel> makeRequest(Request request, String url) async {
    switch (request) {
      case Request.get:
        try {
          final response = await http
              .get(Uri.parse(url))
              .timeout(const Duration(seconds: 60));
          return _responseModel(response);
        } on TimeoutException catch (_) {
          return ResponseModel(
              data: '{"message":"Request timed out"}',
              hasError: true,
              errorCode: 1000);
        }
      case Request.put:
        try {
          final response = await http
              .get(Uri.parse(url))
              .timeout(const Duration(seconds: 60));
          return _responseModel(response);
        } on TimeoutException catch (_) {
          return ResponseModel(
              data: '{"message":"Request timed out"}',
              hasError: true,
              errorCode: 1000);
        }
      default:
        return ResponseModel(
            data:
            '{"message":"No internet, please enable mobile data or wi-fi in your phone settings and try again"}',
            hasError: true,
            errorCode: 1000
        );
    }

  }

  ResponseModel _responseModel(http.Response response) {
    switch(response.statusCode){
      case 200:
        return ResponseModel(
          data: response.body,
          hasError: false,
          errorCode: response.statusCode
        );
      default :
        return ResponseModel(data: response.body,hasError: true,errorCode: response.statusCode);
    }
  }
}
