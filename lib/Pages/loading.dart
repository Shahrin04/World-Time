import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/service/world_clock.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldClock worldClock = WorldClock(location: 'Dhaka', flag: 'bangladesh.png', url: 'Asia/Dhaka');
    await worldClock.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldClock.location,
      'flag': worldClock.flag,
      'time': worldClock.time,
      'isDayTime': worldClock.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.lightGreen,
          size: 50.0,
        )
      )
    );
  }
}
