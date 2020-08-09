import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;

    String bgImage = (data['isDaytime']) ? 'day1.jpg':'night.jpg';
    Color bgColor = (data['isDaytime']) ? Colors.blueAccent[400] : Colors.blue[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/$bgImage'),
             fit: BoxFit.cover,
           )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
//              SizedBox(height: 100.0,),
                RaisedButton.icon(
                  onPressed: () async{
                     dynamic result =  await Navigator.pushNamed(context, '/Location');
                     if( result!=null){
                       setState(() {
                         data['location'] = result['location'];
                         data['flag'] = result['flag'];
                         data['time'] = result['time'];
                         data['isDaytime'] = result['isDaytime'];
                       });
                     }
                  },
                  icon: Icon(Icons.location_on),
                  label: Text("Change Location"),
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'], style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      color: Colors.blueAccent[700],
                    ),),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'], style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.red,
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
