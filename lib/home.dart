import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/login.dart';
import 'package:new_app/models/course.dart';
import 'package:new_app/services/course_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  _loadCourses() async {
    String jsonData =
        await DefaultAssetBundle.of(context).loadString("assets/courses.json");
    setState(() {
      _courses = CourseApi.allCources(jsonData);
    });
  }

  List<Card> _buildCardGrid(BuildContext context) {
    if(_courses == null || _courses.isEmpty){
      return const <Card>[];
    }
    return _courses.map((course) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0),
          side: BorderSide(color: sPDarkOrange),
        ),
        elevation: 4.0,
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
                              cardCircularImage(course.companyPictureUrl),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  cardTitle(course.companyName),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  cardTitle(course.courseName),
                                  cardText(course.descreption),
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
    }).toList();
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
        title??"defualt Title",
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
          text??"defualt card Text",
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

  @override
  Widget build(BuildContext context) {
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
        children: _buildCardGrid(context),
      ),
    );
  }
}
