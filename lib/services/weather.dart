import 'package:tempo/services/location.dart';
import 'package:tempo/services/networking.dart';

const apiKey = '692728f73ef61d04780c021dea06a710';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const unit = 'metric'; //metric or imperial

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      url: '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=$unit',
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      url:
          '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=$unit',
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getWeatherBackgroundImage(int temp) {
    if (temp > 17) {
      return 'images/summer_background.jpg';
    } else if (temp > 12) {
      return 'images/location_background.jpg';
    } else if (temp < 6) {
      return 'images/winter_background.jpg';
    } else {
      return 'images/rainy_background.jpg';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
