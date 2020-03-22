import 'package:flutter/material.dart';
import 'package:new_app/login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imagePath = "images/microsoft.jpg";
    final title = " Card Title";
    final courseTitle = "Course Title";
    final details =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
    return Scaffold(
      drawer: Drawer(
        child: ButtonBar(
          children: <Widget>[
            RaisedButton(
              child: Text("Logout"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Summer Training",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("Filter Button");
            },
            icon: Icon(
              Icons.filter_list,
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 27 / 20,
        children: <Widget>[
          _buildCard("images/coursera.png", title, courseTitle, details),
          _buildCard("images/google.png", title, courseTitle, details),
          _buildCard(imagePath, title, courseTitle, details),
          _buildCard(imagePath, title, courseTitle, details),
        ],
      ),
    );
  }
}

Widget cardCircularImage(String path) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundImage: AssetImage(path),
        radius: 50.0,
        backgroundColor: Colors.transparent,
      ),
    ),
  );
}

Widget cardTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15.0,
    ),
    child: Text(
      title,
    ),
  );
}

Widget cardText(String text) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15.0,
      top: 10.0,
    ),
    child: SizedBox(
      width: 190,
      height: 80,
      child: Text(
        text,
        softWrap: true,
        overflow: TextOverflow.fade,
      ),
    ),
  );
}

Widget cardButton() {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: RaisedButton(
      onPressed: () {},
      child: Text("More Details"),
    ),
  );
}

Widget _buildCard(
  String imagePath,
  String title,
  String courseTitle,
  String details,
) {
  return Card(
    elevation: 0.0,
    child: Padding(
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          cardCircularImage(imagePath),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              cardTitle(title),
                              SizedBox(
                                height: 15.0,
                              ),
                              cardTitle(courseTitle),
                              cardText(details),
                            ],
                          ),
                        ],
                      ),
                      ButtonBar(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          cardButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
