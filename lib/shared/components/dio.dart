import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(
        BaseOptions(
          baseUrl: "http://restapi.adequateshop.com/api/",
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> auth({required String url ,required Map<String,dynamic> data})async{
    return await dio.post(
        url,
        data:data
    );
  }
}