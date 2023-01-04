import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/MyHomePage.dart';
import 'Login.dart';

void main() {
  // run app is a function that we get from the import above
  // this function run a defined class
  runApp(MyApp());
}

// a stateless widget is rendered directly without any changes
class MyApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title of appp
      title: 'Ralph s App',
      theme: ThemeData(
        // general theme of app
        primarySwatch: Colors.orange,
        // ios and android stability
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home is the first page that will be displayed
      home: LoginPage(),
    );
  }
}
