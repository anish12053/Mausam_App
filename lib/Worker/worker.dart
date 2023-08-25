import 'dart:convert';
import 'package:http/http.dart';


class GetData{
  var location;
  var temperature;
  var humidity;
  var air_speed;
  var description;
  var icon ;

  GetData({var loc}){
    location = loc;
  }

  Future<void> getData() async{

    try {
      // Response response1 = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Kolkata"));
      Response response2 = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&APPID=27467266273e2605fe2aa508f95120b6"));
      // Map data = jsonDecode(response1.body);
      Map data = jsonDecode(response2.body);
      List weather = data["weather"];
      Map temp_data = weather[0];
      description = temp_data["description"];
      icon = temp_data["icon"];

      Map temp_data_2 = data["wind"];
      air_speed = temp_data_2["speed"]/0.27777777777778;

      Map temp_data_3 = data["main"];
      temperature = temp_data_3["temp"]-273.15;
      humidity = temp_data_3["humidity"];
    }catch(e){
      var location = "can't find data";
      var temperature = "can't find data";
      var humidity = "can't find data";
      var air_speed = "can't find data";
      var description = "can't find data";
      icon = "03n";
    }

  }

}