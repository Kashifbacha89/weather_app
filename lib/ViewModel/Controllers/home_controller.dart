import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app/Model/weather_data_model.dart';
import 'package:weather_app/Resourses/images/image_assets.dart';
import 'package:weather_app/Utilities/utilities.dart';

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
}
