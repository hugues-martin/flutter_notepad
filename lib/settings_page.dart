import 'package:flutter/material.dart';
import 'settings.dart';
import 'main.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _notepadFormKey = GlobalKey<FormState>();
  Color selectedColor;

  List<DropdownMenuItem<Color>> colorSettings = [
    DropdownMenuItem(value: Colors.red, child: Text('rouge')),
    DropdownMenuItem(value: Colors.blue, child: Text('bleu')),
    DropdownMenuItem(value: Colors.green, child: Text('vert')),
  ];

  _SettingsPageState() {
    Settings().getColor().then((Color color) {
      setState(() {
        selectedColor = _getColorFromDropdown(colorSettings, color);
        context.findRootAncestorStateOfType<MyAppState>().setThemeColor(color);
      });
    });
  }

  // Returns the exact Color object from the dd list which matches the input color
  Color _getColorFromDropdown(
      List<DropdownMenuItem<Color>> ddList, Color color) {
    return colorSettings.firstWhere((DropdownMenuItem item) {
          if (item.value.value == color.value)
            return true;
          else
            return false;
        }).value ??
        Colors.red;
  }

  Widget NoteEditForm(BuildContext context) {
    return Form(
      key: _notepadFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButtonFormField(
            value: selectedColor,
            items: colorSettings,
            onChanged: (Color val) {
              setState(() {
                selectedColor = val;
                context
                    .findRootAncestorStateOfType<MyAppState>()
                    .setThemeColor(val);
                Settings().setColor(selectedColor);
              });
            },
            decoration: InputDecoration(hintText: 'Couleur'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NoteEditForm(context),
      ),
    );
  }
}
