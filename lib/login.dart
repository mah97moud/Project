import 'package:flutter/material.dart';
import 'package:new_app/create-account.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("images/logo.png"),
                  radius: 60,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 120.0,
            ),
            buildTextField("Username", false),
            SizedBox(
              height: 20,
            ),
            buildTextField("Password", true),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Create",
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CreateAccount(),
                      ),
                    );
                  },
                ),
                RaisedButton(
                  child: Text("Sign In"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String text, bool isPassword) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: TextField(
      textAlign: TextAlign.left,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 30,
        ),
        filled: true,
        labelText: text,
        labelStyle: TextStyle(
          color: Color.fromRGBO(117, 117, 117, 1),
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: "Segoe",
        ),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
        ),
      ),
      obscureText: isPassword,
    ),
  );
}
