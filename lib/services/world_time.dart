import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String time;
  String location;
  String url;
  String flag;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url} );

  Future<void> getTime () async {

    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);
      String Isplus = data['utc_offset'].substring(0,1);
      DateTime now = DateTime.parse(datetime);
      if(Isplus == '+'){
        now = now.add(Duration(
            hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
      }
      else{
        now = now.subtract(Duration(
            hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
      }

      isDaytime = (now.hour>6&&now.hour<20) ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      time = "Could not get the time";
    }

  }

}