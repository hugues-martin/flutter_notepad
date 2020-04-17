import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'settings.dart';

class NoteEditPage extends StatefulWidget {
  NoteEditPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NoteEditPageState createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final _notepadFormKey = GlobalKey<FormState>();

  Widget NoteEditForm(BuildContext context) {
    return Form(
        key: _notepadFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Titre',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Le titre ne peut pas être vide';
                }
                return null;
              },
            ),
            TextFormField(
              minLines: 10,
              maxLines: 11,
              decoration: const InputDecoration(
                hintText: 'Corps de la note',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Il faut mettre du texte';
                }
                return null;
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_notepadFormKey.currentState.validate()) {
                      // TODO
                    }
                  },
                  child: Text('Sauver'),
                ))
          ],
        ));
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
          child: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsPage(title: 'Settings')));
              },
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NoteEditForm(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
