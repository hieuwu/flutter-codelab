import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: ListView(children: [bioSection, activitySection]));
  }
}

Column _buildActivityItem(String text, String type) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(type)
    ],
  );
}

Widget activitySection = Container(
  child: Center(
    child: Row(
      children: [
        Expanded(child: _buildActivityItem('35', 'Posts')),
        Expanded(child: _buildActivityItem('12', 'Followers')),
        Expanded(child: _buildActivityItem('123', 'Followings')),
      ],
    ),
  )
);

Widget bioSection = Container(
  padding: const EdgeInsets.all(14),
  child:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      'Vu Hoang Hieu',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    Text('Software engineer')
  ]),
);
