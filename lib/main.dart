import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _state createState() => new _state();
}

class _state extends State<MyApp> {
  void showUrl() {
    _launch("http://dalwadi2.github.io");
  }

  void showEmail() {
    _launch("mailto:dalwadi2@gmail.com");
  }

  void showPhone() {
    _launch("tel:+91-7878348267");
  }

  void showSms() {
    _launch("sms:+91-7878348267");
  }

  void _launch(String urlString) async {
    print('out');
    if (await canLaunch(urlString)) {
      print('in');
      await launch(urlString);
    } else {
      print('else');
      throw 'Caould not launch this URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Title'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: showUrl,
                child: new Text('URl'),
              ),
              new RaisedButton(
                onPressed: showEmail,
                child: new Text('Email'),
              ),
              new RaisedButton(
                onPressed: showSms,
                child: new Text('SMS'),
              ),
              new RaisedButton(
                onPressed: showPhone,
                child: new Text('Telephone'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
