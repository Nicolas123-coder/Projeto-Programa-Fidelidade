// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';

import './pages/login.dart';
import './about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fidely',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Fidely'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Nicolas de Barros'), 
              accountEmail: new Text('email@test.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('https://gravatar.com/avatar/0aad39801d4bb384f049d5b70b1f6d78?s=400&d=robohash&r=x'),
              ),
              ),
              new ListTile(
                title: new Text('About Page'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, new MaterialPageRoute(
                    builder: ((BuildContext context) => new AboutPage())
                  ));
                },
              ),
              new Divider(
                color: Colors.black,
                height: 5.0,
              ),
              new ListTile(
                title: new Text('My Restaurants'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, new MaterialPageRoute(
                    builder: ((BuildContext context) => new AboutPage())
                  ));
                },
              ),
              new Divider(
                color: Colors.black,
                height: 5.0,
              ),
              
              ],
        ),
      ),
      body: LoginPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
