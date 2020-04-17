import 'package:flutter/material.dart';
import 'note_page.dart';
import 'settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ColorSwatch selectedColorSwatch = Colors.red;

  MyAppState() {
    Settings().getColor().then((Color color) {
      setThemeColor(color);
    });
  }

  void setThemeColor(Color color) {
    print("Set theme");
    setState(() {
      if (color.value == Colors.red.value)
        selectedColorSwatch = Colors.red;
      else if (color.value == Colors.blue.value)
        selectedColorSwatch = Colors.blue;
      else if (color.value == Colors.green.value)
        selectedColorSwatch = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: selectedColorSwatch,
      ),
      home: NoteEditPage(title: 'Mon Bloc Notes'),
    );
  }
}

//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
//
//
//
//class MyApp extends StatelessWidget {

// This widget is the root of your application.
