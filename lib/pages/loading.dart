import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorld() async {
    WorldTime tim = WorldTime(location: 'Kolkata', flag: 'india.jpg', url: 'Asia/Kolkata');
        await tim.getTime();
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          'location' : tim.location,
          'flag': tim.flag,
          'time': tim.time,
          'isDaytime': tim.isDaytime,
        });

        //print(tim.time);
  }

  @override
  void initState() {
    super.initState();
    setUpWorld();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           SpinKitRotatingCircle(
             color: Colors.blue,
             size: 50.0,
           ),
            SizedBox(height: 10.0,)
          ],
        ),
      ),
    );
  }
}
