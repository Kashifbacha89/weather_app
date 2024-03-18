import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/Resourses/images/image_assets.dart';
import 'package:weather_app/Utilities/utilities.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

import '../../Model/weather_data_model.dart';

class DaysController extends GetxController{
  RxInt currentDay=0.obs;
  final homeController=Get.put(HomeController());
  late Rx<Days> day;
  DaysController(){
    day=homeController.weatherModel.value!.days![0].obs;
  }
  setDay(int index){
    day.value=homeController.weatherModel.value!.days![index];
    currentDay.value=index;

  }
  String getImage(int index){
    return Utilities.imageMap[homeController.weatherModel.value!.days![index].conditions]==null?
        ImageAssets.nightStarRain:
        Utilities.imageMap[homeController.weatherModel.value!.days![index].conditions]!;
  }
  String getMonth(int index){
    String date=homeController.weatherModel.value!.days![index].datetime.toString();
    return Utilities.extractDay(date);
  }
  String getMonthDay(int index){
    String date=homeController.weatherModel.value!.days![index].datetime.toString();
    return Utilities.extractDay(date);
  }
  String getDate(int index){
    DateTime date=DateTime.parse(homeController.weatherModel.value!.days![index].datetime.toString());
    return Utilities.formatDate(date);
  }
  String getMinTemp(int index){
    return "${homeController.weatherModel.value!.days![index].tempmin!.toInt().toString()}\u0080";
  }
  String getMaxTemp(int index){
    return "${homeController.weatherModel.value!.days![index].tempmax!.toInt().toString()}\u0080";
  }

}
