import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:joke/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:swipe/swipe.dart';
import 'models/counter_jokes.dart';
import 'models/joke_model.dart';
import 'package:joke/screens/sec_screen.dart';
// import 'models/swipe_card.dart';
import 'package:joke/models/swipe_card.dart';

// import 'models/joke_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => JokesCart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyWidget(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}