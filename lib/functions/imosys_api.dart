import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:imosys_flutter_package/constants/imosys_strings.dart';
import 'package:imosys_flutter_package/util/imosys_app_wrapper.dart';

class ImosysAPI {
  static Future<Map<String, dynamic>> getWithoutAuthorization(
      String endpoint) async {
    Map<String, dynamic> responseMap = {
      'status': 0,
      'data': null,
      'msg': ImosysStrings.somethingWentWrong
    };
    try {
      log("-------$endpoint");
      final response = await http
          .get(Uri.parse("${ImosysConfig.baseUrl}$endpoint"), headers: {
        "Accept": "application/json",
      });
      log(response.body);
      final result = jsonDecode(response.body);
      if (result["status"] != null && result["status"] == 1) {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": response.body,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      } else {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": null,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      }
      return responseMap;
    } on SocketException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.noInternetConnection
      };
      return responseMap;
    } on TimeoutException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.requestTimedOut
      };
      return responseMap;
    } catch (e) {
      log(e.toString());
      return responseMap;
    }
  }

  static Future<Map<String, dynamic>> getWithAuthorization(
      String endpoint) async {
    Map<String, dynamic> responseMap = {
      'status': 0,
      'data': null,
      'msg': ImosysStrings.somethingWentWrong
    };
    try {
      log("-------$endpoint");
      final token = ImosysConfig.token;
      final response = await http
          .get(Uri.parse("${ImosysConfig.baseUrl}$endpoint"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      log(response.body);
      final result = jsonDecode(response.body);
      if (result["status"] != null && result["status"] == 1) {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": response.body,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      } else {
        if (result["message"] != null) {
          responseMap = {
            "status": result["status"] ?? 0,
            "data": null,
            "msg": result["message"]
          };
        } else {
          responseMap = {
            "status": result["status"] ?? 0,
            "data": null,
            "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
          };
        }
      }
      return responseMap;
    } on SocketException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.noInternetConnection
      };
      return responseMap;
    } on TimeoutException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.requestTimedOut
      };
      return responseMap;
    } catch (e) {
      log(e.toString());
      return responseMap;
    }
  }

  static Future<Map<String, dynamic>> postWithoutAuthorization(
      String endpoint, Map<String, dynamic>? body) async {
    Map<String, dynamic> responseMap = {
      'status': 0,
      'data': null,
      'msg': ImosysStrings.somethingWentWrong
    };
    try {
      log("-------$endpoint");
      final response =
          await http.post(Uri.parse("${ImosysConfig.baseUrl}$endpoint"),
              headers: {
                "Accept": "application/json",
              },
              body: body ?? {});
      log(response.body);
      final result = jsonDecode(response.body);
      if (result["status"] != null && result["status"] == 1) {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": response.body,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      } else {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": null,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      }
      return responseMap;
    } on SocketException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.noInternetConnection
      };
      return responseMap;
    } on TimeoutException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.requestTimedOut
      };
      return responseMap;
    } catch (e) {
      log(e.toString());
      return responseMap;
    }
  }

  static Future<Map<String, dynamic>> postWithAuthorization(
      String endpoint, Map<String, dynamic>? body) async {
    Map<String, dynamic> responseMap = {
      'status': 0,
      'data': null,
      'msg': ImosysStrings.somethingWentWrong
    };
    try {
      log("-------$endpoint");
      //log(body.toString());
      final token = ImosysConfig.token;
      final response =
          await http.post(Uri.parse("${ImosysConfig.baseUrl}$endpoint"),
              headers: {
                "Accept": "application/json",
                "Authorization": "Bearer $token",
                "Content-Type": "application/json"
              },
              body: body != null ? jsonEncode(body) : {});
      log("response body---------------");
      log(response.body);
      final result = jsonDecode(response.body);
      if (result["status"] != null && result["status"] == 1) {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": response.body,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      } else {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": null,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      }
      return responseMap;
    } on SocketException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.noInternetConnection
      };
      return responseMap;
    } on TimeoutException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.requestTimedOut
      };
      return responseMap;
    } catch (e) {
      log(e.toString());
      return responseMap;
    }
  }

  static Future<Map<String, dynamic>> postWithAuthorizationWithObjectBody(
      String endpoint, dynamic body) async {
    Map<String, dynamic> responseMap = {
      'status': 0,
      'data': null,
      'msg': ImosysStrings.somethingWentWrong
    };
    try {
      log("-------$endpoint");
      //log(body.toString());
      final token = ImosysConfig.token;
      final response =
          await http.post(Uri.parse("${ImosysConfig.baseUrl}$endpoint"),
              headers: {
                "Accept": "application/json",
                "Authorization": "Bearer $token",
                "Content-Type": "application/json"
              },
              body: body != null ? jsonEncode(body) : {});
      log("response body---------------");
      log(response.body);
      final result = jsonDecode(response.body);
      if (result["status"] != null && result["status"] == 1) {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": response.body,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      } else {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": null,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      }
      return responseMap;
    } on SocketException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.noInternetConnection
      };
      return responseMap;
    } on TimeoutException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.requestTimedOut
      };
      return responseMap;
    } catch (e) {
      log(e.toString());
      return responseMap;
    }
  }

  static Future<Map<String, dynamic>> postMultipartImageWithAuthorization(
    String endpoint, {
    Map<String, String?>? fields,
    Map<String, File?>? files,
  }) async {
    Map<String, dynamic> responseMap = {
      'status': 0,
      'data': null,
      'msg': 'Something went wrong'
    };

    try {
      log("-------$endpoint");
      log("Fields-------$fields");
      log("Files-------$files");

      final token = ImosysConfig.token;
      final uri = Uri.parse("${ImosysConfig.baseUrl}$endpoint");

      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        });

      if (fields != null) {
        fields.forEach((key, value) {
          if (value != null) {
            request.fields[key] = value;
          }
        });
      }

      if (files != null) {
        files.forEach((key, file) {
          if (file != null && file.existsSync()) {
            request.files.add(http.MultipartFile(
              key,
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path.split('/').last,
              contentType: MediaType('image', 'jpeg'),
            ));
          }
        });
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      log("response body---------------");
      log(responseBody);

      final result = jsonDecode(responseBody);
      if (result["status"] != null && result["status"] == 1) {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": responseBody,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      } else {
        responseMap = {
          "status": result["status"] ?? 0,
          "data": null,
          "msg": result["msg"] ?? ImosysStrings.somethingWentWrong
        };
      }
      return responseMap;
    } on SocketException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.noInternetConnection
      };
      return responseMap;
    } on TimeoutException catch (_) {
      Map<String, dynamic> responseMap = {
        'status': 0,
        'data': null,
        'msg': ImosysStrings.requestTimedOut
      };
      return responseMap;
    } catch (e) {
      log(e.toString());
      return responseMap;
    }
  }
}
