import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  //This object from Dio is the one that'll make me deal with APIs
  // But it's still empty

  //Create dio object and fill it by calling it in main every time app runs
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://bsubackendapi.com/api/', //   API
      receiveDataWhenStatusError: true,
    ));
  }
  //HTTP GET METHOD : Retrieving data from a server.
  static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
    //Headers
    String lang = 'en',
    String? token,
  }) async {
    // Path is the method url from api link

    //Review comment in post
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };

    return await dio!.get(url, queryParameters: query);
  }

  //HTTP POST METHOD  - To send data to api
  static Future<Response> postData({
    required url,
    required data,
    Map<String, dynamic>? query,
    //Headers
    String lang = 'en',
    String? token,
  }) async {
    //When we want to post data we may need to send headers .. This is how to do it
    // lang can be changed so is token, that's why we didn't put them in BaseOptions above
    // like 'Application-Content'

    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang, // if I send en for example change default
      'Authorization': token,
    };

    return await dio!.post(url, data: data, queryParameters: query);
  }}