import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app/Model/weather_data_model.dart';
import 'package:weather_app/Repository/home_repository.dart';
import 'package:weather_app/Resourses/images/image_assets.dart';
import 'package:weather_app/Utilities/utilities.dart';
import 'package:weather_app/view/home/home_view.dart';

class HomeController extends GetxController {
  Rx<WeatherDataModel?> weatherModel = Rx<WeatherDataModel?>(null);
  Rx<Hours?> hours = Rx<Hours?>(null);
  Rx<int> currentIndex = 0.obs;
  RxBool animator = false.obs;
  int getCurrentIndex() => currentIndex.value;
  bool compareIndex(int index) => index == currentIndex.value;
  String getHour(int index) => Utilities.formateTimeWithoutAmPm(
      weatherModel.value!.days![0].hours![index].datetime.toString());
  String getImage(int index) => Utilities.imageMap[weatherModel
              .value!.days![0].hours![index].conditions
              .toString()] ==
          null
      ? ImageAssets.nightStarRain
      : Utilities.imageMap[
          weatherModel.value!.days![0].hours![index].conditions.toString()]!;
  String getAddress() =>
      "${weatherModel.value!.address.toString()},\n${weatherModel.value!.timezone.toString()}";
  String getCondition()=>hours.value!.conditions.toString();
  String getCurrentTemp()=>hours.value!.temp!.toInt().toString();
  String getFeelLike()=>hours.value!.feelslike!.toString();
  String getCloudOver()=>hours.value!.cloudcover!.toInt().toString();
  String getWindSpeed()=>hours.value!.windspeed!.toInt().toString();
  String getHumidity()=>hours.value!.humidity!.toInt().toString();

  getWeatherData(){
    HomeRepository.hitApi().then((value) {
      weatherModel.value=WeatherDataModel.fromJson(value);
      for(int i=0; i<weatherModel.value!.days![0].hours!.length;i++){
        if(Utilities.checkTime(weatherModel.value!.days![0].hours![i].datetime.toString())){
          hours.value=weatherModel.value!.days![0].hours![i];
          currentIndex.value= i;
          break;
        }

      }
      Get.to(const HomeView());
    });
  }
  setHour(int index){
    Timer(const Duration(milliseconds: 100), ()=>animator.value=true);
    currentIndex.value=index;
    hours.value=weatherModel.value!.days![0].hours![index];
    Timer(const Duration(milliseconds: 100), ()=>animator.value=false);

  }


}
