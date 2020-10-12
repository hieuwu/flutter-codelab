import 'package:flutter/cupertino.dart';
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
        primaryColor: Colors.white,
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
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
            ),
            body: Column(children: [
              headerSection,
              bioSection,
              activitySection,
              SizedBox(
                height: 50,
                child: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.grid_view),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.live_tv,
                        ),
                      ),
                      Tab(
                        icon: Icon(Icons.tag),
                      ),
                      Tab(
                        icon: Icon(Icons.person)
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // first tab bar view widget
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('images/social-1.jpg',fit: BoxFit.cover,),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('images/social-2.jpg',fit: BoxFit.cover,),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('images/social-3.jpg',fit: BoxFit.cover,),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('images/social-4.jpg',fit: BoxFit.cover,),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('images/social-5.jpg',fit: BoxFit.cover,),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('images/social-6.jpg',fit: BoxFit.cover,),
                            ),
                          ],
                        )
                      ),
                    ),

                    // second tab bar viiew widget
                    Container(
                      color: Colors.pink,
                      child: Center(
                        child: Text(
                          'Car',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
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
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
    ),
    padding: const EdgeInsets.only(top: 12, bottom: 12),
    child: Center(
      child: Row(
        children: [
          Expanded(child: _buildActivityItem('35', 'Posts')),
          Expanded(child: _buildActivityItem('12', 'Followers')),
          Expanded(child: _buildActivityItem('123', 'Followings')),
        ],
      ),
    ));

Widget bioSection = Container(
  padding: const EdgeInsets.only(left: 24, top: 14, bottom: 14),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      'Vu Hoang Hieu',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    Text('Software engineer')
  ]),
);

Widget headerSection = Container(
  padding: const EdgeInsets.only(left: 20, top: 12),
  child: Row(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: new AssetImage(
              'images/rose.jpg',
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('hieuvu_', style: TextStyle(fontSize: 24)),
                Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: Icon(
                    Icons.settings,
                  ),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  "Edit profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      )
    ],
  ),
);
