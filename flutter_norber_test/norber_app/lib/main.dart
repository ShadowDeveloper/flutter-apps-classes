import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          primaryColor: Colors.deepOrangeAccent),
      home: MyHomePage(title: 'NewCollector'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  /* Maps Configuration */
  static GoogleMapController mapController;
  static final LatLng _center = const LatLng(45.521563, -122.677433);
  static void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  /* Maps Configuration */

  static final List<Widget> _widgetOptions = <Widget>[
    WebView(
      initialUrl: "https://google.com",
      javascriptMode: JavascriptMode.unrestricted,

      /*onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },*/
    ),
    Text(
      'Index 1: Teste 1',
      style: optionStyle,
    ),
    Text(
      'Index 2: Teste 2',
      style: optionStyle,
    ),
    GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      mapType: MapType.normal,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            title: Text('Marcar ponto'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Congigurações'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Local'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
