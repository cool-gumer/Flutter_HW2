import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

import 'models/joke_model.dart';

// import 'models/joke_model.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Chuck Joke';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  MyWidgetState createState() => new MyWidgetState();
}


class MyWidgetState extends State<MyWidget> {
  late JokeModel joke ;
  int counterJoke = 0;
  int counterLike = 0;

  Future<void> getJoke() async {

    var response = await http.get(
        Uri.parse("https://api.chucknorris.io/jokes/random"),
        headers: {"Accept": "application/json"});

    setState(() {
      joke = JokeModel.fromJson(json.decode(response.body));
      counterJoke++;
      if (counterJoke%5 == 0 ){
        showDialog(context: context, builder: (con){return Container(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Percent of liked jokes ${(100*(counterLike/counterJoke)).toInt()} %")],),);});
      }
    });
  }
  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          scaffoldBackgroundColor: Colors.white70),
      home: Scaffold(
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https://media.gettyimages.com/photos/actor-chuck-norris-arrives-at-lionsgate-films-the-expendables-2-on-picture-id150327735?k=20&m=150327735&s=612x612&w=0&h=YQPD27bpNruPlbWTQXdmbYyv-GLNhe_4Zxpt5cNSkrY=",height:200 ,fit: BoxFit.cover,width:MediaQuery.of(context).size.width ,),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Text('${joke.value}',
                      style:
                          new TextStyle(color: Colors.black, fontSize: 20.0)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text('No'),
                      onPressed: getJoke,
                      //color: Colors.red,
                    ),
                    ElevatedButton(
                      child: Text('Open in Browser'),
                      onPressed:(){launchUrl(Uri.parse(joke.url));},
                      //color: Colors.red,
                    ),
                    ElevatedButton(
                      child: Text('Yes'),
                      onPressed:(){getJoke();counterLike++;} ,
                      //color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getJoke();
  }
}
