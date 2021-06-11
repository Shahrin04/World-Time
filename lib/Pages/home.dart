import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set image
    String bgImage = data['isDayTime'] ? 'day.png':'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue:Colors.indigo[600];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
                  SizedBox(height: 6.0),
                  FlatButton.icon(
                      onPressed: () async{
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {
                           'location': result['location'],
                           'time': result['time'],
                           'flag': result['flag'],
                           'isDayTime': result['isDayTime']
                         };
                       });
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300]
                        ),
                      )
                  ),
                  SizedBox(height: 20.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/${data['flag']}'),
                        radius: 14,
                      ),

                      SizedBox(width: 6.0),

                      Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          letterSpacing: 2.0
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),

                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 66.0
                    ),
                  )

                ],
              ),
            ),
          )),
    );
  }
}
