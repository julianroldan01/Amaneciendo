import 'package:dio/dio.dart';

import 'Secure_Storage.dart';

class Apidio {
  Dio dio = Dio();

  static Dio dioAuth() {
    var tokenStorage = SecureStorage.getToken();
    if (tokenStorage != null) {
      tokenStorage.then((result) {
        if (result != null) {
          String token = result;
          print(token);
          return Dio(
              BaseOptions(headers: {'authorization': 'Bearer ${token}'}));
        }
      });
    }
    return Dio(BaseOptions(headers: {'authorization': 'Bearer null'}));
  }
}
