import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Theme with ChangeNotifier {
  ThemeData _theme = ThemeData();
  ThemeData get theme => _theme;

  void lightTheme() {
    _theme = ThemeData(
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      canvasColor: Colors.white,
      textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
    );
    notifyListeners();
  }

  void darkTheme() {
    _theme = ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      canvasColor: Colors.black,
      textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
    );
    notifyListeners();
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(builder: (_) => Theme())],
      child: Consumer<Theme>(builder: (context, bg, _) {
        final ThemeModel = Provider.of<Theme>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeModel.theme,
          home: HomePage(),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeModel = Provider.of<Theme>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Light and Dark Theme"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                ThemeModel.lightTheme();
              },
              child: Text("Light Theme"),
            ),
            RaisedButton(
              onPressed: () {
                ThemeModel.darkTheme();
              },
              child: Text("Dark Theme"),
            ),
          ],
        ),
      ),
    );
  }
}
