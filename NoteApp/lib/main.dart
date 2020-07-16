import 'dart:math';

import 'package:NoteApp/Items_page.dart';
import 'package:NoteApp/edit_profile_page.dart';
import 'package:NoteApp/login_page.dart';
import 'package:NoteApp/profile_page.dart';
import 'package:NoteApp/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.tenaliRamakrishnaTextTheme(
          Theme.of(context).textTheme
        ).apply(fontSizeFactor: 1.2)
      ),
      home: MyHomePage(title: 'Flutter Widgets'),
      routes: {
        LoginPage.route: (context) => LoginPage(),
        SignUpPage.route: (context) => SignUpPage(),
        ProfilePage.route: (context) => ProfilePage(),
        EditProfile.route: (context) => EditProfile(),
        Items.route: (context) => Items()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final widgets = [LoginPage.route, SignUpPage.route, ProfilePage.route, Items.route];


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
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index ){
                  Color color = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed(widgets[index]),
                    child: Card(
                      color: color,
                      child: Center(
                        child: Text(widgets[index].replaceAll('/', '')),
                      ),
                    ),
                  );
                },
              childCount: widgets.length
            ),
          )
        ],
      )
    );
  }
}
