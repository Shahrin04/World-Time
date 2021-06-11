import 'package:flutter/material.dart';
import 'package:world_time/service/world_clock.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter=0;
  List<WorldClock> locations = [
    WorldClock(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldClock(url: 'Asia/Dhaka', location: 'Dhaka', flag: 'bangladesh.png'),
    WorldClock(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),
    WorldClock(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldClock(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldClock(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldClock(url: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
    WorldClock(url: 'Asia/Seoul', location: 'Seoul', flag: 'south-korea.png'),
    WorldClock(url: 'America/Chicago', location: 'Chicago', flag: 'united-states.png')
  ];

  void updateInfo(index) async{
    WorldClock instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Card(
              elevation: 5,
              child: ListTile(
                onTap: (){
                  updateInfo(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
