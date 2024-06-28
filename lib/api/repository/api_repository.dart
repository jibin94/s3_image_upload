import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';

import '../api_utils.dart';

class ApiRepo {
  Future uploadImage({
    required String url,
    required Map<String, dynamic>? headers,
    required XFile? imageFile,
  }) async {
    Response? response;
    try {
      response = await apiUtils.put(
          url: url,
          headers: headers,
          data: File(imageFile!.path).readAsBytesSync(),
          options: Options(headers: headers));
      return response;
    } on DioException catch (_) {
      if (_.response != null) {
        return _.response;
      } else {
        return _;
      }
    }
  }
}
