import 'package:flutter/material.dart';
import 'package:world_time/pages/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'uk.png',
        isDaytime: false,
        time: ''),
    WorldTime(
      location: 'kampala',
      flag: 'uganda.png',
      url: 'Africa/kampala',
      time: '',
      isDaytime: false,
    ),
    WorldTime(
        url: 'Africa/Kigali',
        location: 'Kigali',
        flag: 'rwanda.png',
        isDaytime: false,
        time: ''),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png',
        isDaytime: false,
        time: ''),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        isDaytime: false,
        time: ''),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        isDaytime: false,
        time: ''),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        isDaytime: false,
        time: ''),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('${locations[index].flag}'),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Text(
        'Designed by Andy',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
