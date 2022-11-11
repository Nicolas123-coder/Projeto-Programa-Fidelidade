import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'cadastro_beneficio.dart';

class Home_Restaurante extends StatefulWidget {
  @override
  _Home_RestauranteState createState() => new _Home_RestauranteState();
}

class _Home_RestauranteState extends State<Home_Restaurante> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home Restaurante'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Wrap(
              runSpacing: 5,
              children: <Widget>[
                Container(height: 150, width: 350, child: Image.asset('')),
                SizedBox(height: 30),
                Text(
                  'Nome Restaurante',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
