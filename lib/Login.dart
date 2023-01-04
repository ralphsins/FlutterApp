import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'auth.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LoginPage")),
      body: Body(context),
    );
  }
}

class Body extends StatefulWidget {
  final BuildContext context;
  Body(this.context);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
   FirebaseUser user;

  @override
  // signout onload
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click(BuildContext context) {
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(user)))
        });
  }

  Widget googleLoginButton() {
    return OutlinedButton(
      onPressed: () => click(widget.context),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              "assets/google_logo.png",
              height: 35.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Sign in with Google",
                  style: TextStyle(fontSize: 20.0, color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: googleLoginButton(),
    );
  }
}
