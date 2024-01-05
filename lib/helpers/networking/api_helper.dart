import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../hive/hive_methods.dart';
import '../routes/app_routers.dart';
import '../utils/common_methods.dart';

enum ResponseState {
  sleep,
  offline,
  loading,
  pagination,
  complete,
  error,
  unauthorized,
}

class ApiResponse {
  ResponseState state;
  String? message;
  dynamic data;
  ApiResponse({
    required this.state,
    required this.message,
    required this.data,
  });
}

class ApiHelper {
  static final ApiHelper _instance = ApiHelper.instance();
  ApiHelper.instance();
  factory ApiHelper() => _instance;

  final String _serverKey = '';

  final Dio _dio = Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
        error: true,
        request: true,
      ),
    );

  Options _options(
    Map<String, String>? headers,
    bool hasToken,
  ) {
    return Options(
      contentType: 'application/json',
      followRedirects: false,
      validateStatus: (status) {
        return true;
      },
      headers: {
        'Accept': 'application/json',
        'Accept-Language': HiveMethods.getLang(),
        if (HiveMethods.getToken() != null && hasToken) ...{
          'Authorization': HiveMethods.getToken(),
        },
        ...?headers,
      },
    );
  }

  Future<ApiResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    void Function()? onFinish,
    void Function(int, int)? onReceiveProgress,
    bool hasToken = true,
  }) async {
    ApiResponse responseJson;
    if (await CommonMethods.hasConnection() == false) {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }

    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: _options(headers, hasToken),
        onReceiveProgress: onReceiveProgress,
      );
      responseJson = _buildResponse(response);
      Future.delayed(Duration.zero, onFinish);
    } on DioException {
      responseJson = ApiResponse(
        state: ResponseState.error,
        message: CommonMethods.translateApi(
          ar: "حدث خطأ",
          en: "An error occurred",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
    } on SocketException {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    return responseJson;
  }

  Future<ApiResponse> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, String>? headers,
    void Function()? onFinish,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    bool hasToken = true,
  }) async {
    ApiResponse responseJson;

    if (await CommonMethods.hasConnection() == false) {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    try {
      final response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: body,
        options: _options(headers, hasToken),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      responseJson = _buildResponse(response);
      Future.delayed(Duration.zero, onFinish);
    } on DioException {
      responseJson = ApiResponse(
        state: ResponseState.error,
        message: CommonMethods.translateApi(
          ar: "حدث خطأ",
          en: "An error occurred",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    } on SocketException {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    return responseJson;
  }

  Future<ApiResponse> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, String>? headers,
    void Function()? onFinish,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    bool hasToken = true,
  }) async {
    ApiResponse responseJson;

    if (await CommonMethods.hasConnection() == false) {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    try {
      final response = await _dio.put(
        url,
        queryParameters: queryParameters,
        data: body,
        options: _options(headers, hasToken),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      responseJson = _buildResponse(response);
      Future.delayed(Duration.zero, onFinish);
    } on DioException {
      responseJson = ApiResponse(
        state: ResponseState.error,
        message: CommonMethods.translateApi(
          ar: "حدث خطأ",
          en: "An error occurred",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
    } on SocketException {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    return responseJson;
  }

  Future<ApiResponse> patch(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, String>? headers,
    void Function()? onFinish,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    bool hasToken = true,
  }) async {
    ApiResponse responseJson;

    if (await CommonMethods.hasConnection() == false) {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    try {
      final response = await _dio.patch(
        url,
        queryParameters: queryParameters,
        data: body,
        options: _options(headers, hasToken),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      responseJson = _buildResponse(response);
      Future.delayed(Duration.zero, onFinish);
    } on DioException {
      responseJson = ApiResponse(
        state: ResponseState.error,
        message: CommonMethods.translateApi(
          ar: "حدث خطأ",
          en: "An error occurred",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
    } on SocketException {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    return responseJson;
  }

  Future<ApiResponse> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, String>? headers,
    void Function()? onFinish,
    bool hasToken = true,
  }) async {
    ApiResponse responseJson;

    if (await CommonMethods.hasConnection() == false) {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    try {
      final response = await _dio.delete(
        url,
        queryParameters: queryParameters,
        data: body,
        options: _options(headers, hasToken),
      );
      responseJson = _buildResponse(response);
      Future.delayed(Duration.zero, onFinish);
    } on DioException {
      responseJson = ApiResponse(
        state: ResponseState.error,
        message: CommonMethods.translateApi(
          ar: "حدث خطأ",
          en: "An error occurred",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
    } on SocketException {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    return responseJson;
  }

  Future<ApiResponse> download(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, String>? headers,
    void Function()? onFinish,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    bool hasToken = true,
  }) async {
    ApiResponse responseJson;

    if (await CommonMethods.hasConnection() == false) {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    final fileName = path.basename(url);
    final savePath = await _getFilePath(fileName);
    try {
      final response = await _dio.download(
        url,
        savePath,
        queryParameters: queryParameters,
        data: body,
        options: _options(headers, hasToken),
        onReceiveProgress: onReceiveProgress,
      );
      responseJson = _buildResponse(response);
      Future.delayed(Duration.zero, onFinish);
    } on DioException {
      responseJson = ApiResponse(
        state: ResponseState.error,
        message: CommonMethods.translateApi(
          ar: "حدث خطأ",
          en: "An error occurred",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
    } on SocketException {
      responseJson = ApiResponse(
        state: ResponseState.offline,
        message: CommonMethods.translateApi(
          ar: "تأكد من الاتصال بالإنترنت",
          en: "Make sure you are connected to the internet",
          context: AppRouters.navigatorKey.currentContext!,
        ),
        data: null,
      );
      Future.delayed(Duration.zero, onFinish);
      return responseJson;
    }
    return responseJson;
  }

  ApiResponse _buildResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return ApiResponse(
          state: ResponseState.complete,
          message: responseJson['message'],
          data: responseJson,
        );
      case 201:
        var responseJson = response.data;
        return ApiResponse(
          state: ResponseState.complete,
          message: responseJson['message'],
          data: responseJson,
        );
      case 400:
        var responseJson = response.data;
        return ApiResponse(
          state: ResponseState.error,
          message: responseJson['message'],
          data: responseJson,
        );
      case 401:
        var responseJson = response.data;
        return ApiResponse(
          state: ResponseState.unauthorized,
          message: responseJson['message'],
          data: responseJson,
        );
      case 422:
        var responseJson = response.data;
        return ApiResponse(
          state: ResponseState.error,
          message: responseJson['message'],
          data: responseJson,
        );
      case 403:
        var responseJson = response.data;
        return ApiResponse(
          state: ResponseState.error,
          message: responseJson['message'],
          data: responseJson,
        );
      case 500:
      default:
        var responseJson = response.data;
        return ApiResponse(
          state: ResponseState.error,
          message: responseJson['message'],
          data: responseJson,
        );
    }
  }

  Future<String> _getFilePath(uniqueFileName) async {
    String path = '';
    Directory dir = await getApplicationDocumentsDirectory();
    path = '${dir.path}/$uniqueFileName.pdf';
    return path;
  }

  Future<void> sendNotification({
    required String title,
    required String body,
    required String to,
    Map<String, dynamic>? data,
    void Function()? onFinish,
  }) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$_serverKey',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'body': body, 'title': title},
            'priority': 'high',
            'data': <String, dynamic>{...?data},
            'to': to,
          },
        ),
      );
      Future.delayed(Duration.zero, onFinish);
    } catch (e) {
      Future.delayed(Duration.zero, onFinish);
      log("error push notification");
    }
  }
}
