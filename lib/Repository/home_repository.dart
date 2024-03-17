import 'package:weather_app/Data/Network/api_services.dart';
import 'package:weather_app/Resourses/AppUrl/app_urls.dart';

class HomeRepository{
  static Future<dynamic> hitApi()async{
    var response=await ApiServices().getApi(AppUrls.url);
    return response;
  }
}