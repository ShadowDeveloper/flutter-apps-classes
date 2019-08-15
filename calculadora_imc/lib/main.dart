import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.person,
            size: 120.0,
            color: Colors.teal,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Peso (Kg)",
                labelStyle: TextStyle(color: Colors.teal)),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0, color: Colors.teal),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Altura (Kg)",
                labelStyle: TextStyle(color: Colors.teal)),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0, color: Colors.teal),
          ),
        ],
      ),
    );
  }
}
