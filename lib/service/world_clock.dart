import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldClock {
  String location; //location name for UI
  String flag; //flag for different location
  String time; //location time
  String url; //location from API endpoint
  bool isDayTime; //day or night if true or false

  WorldClock({this.location, this.flag, this.url});

  Future<void> getTime() async{
    try{
      //making request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      print(data);

      //getting property from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDayTime = now.hour > 5 && now.hour < 18 ? true:false;

      time = DateFormat.jm().format(now);
      print(time);

    }catch(e){
      print('error: $e');
      time = 'Insecure HTTP';
      isDayTime = false;
    }

  }

}
