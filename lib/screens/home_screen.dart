import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:joke/repositories/get_rep.dart';
import 'package:joke/models/swipe_card.dart';
import 'package:joke/repositories/joke_repository.dart';
import 'package:provider/provider.dart';
import "package:joke/models/counter_jokes.dart";
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:swipe/swipe.dart';
import 'package:joke/models/joke_model.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import '../models/joke_saved_model.dart';


class MyWidget extends StatefulWidget {
  @override
  MyWidgetState createState() => new MyWidgetState();
}


class MyWidgetState extends State<MyWidget> {
  late JokeModel joke ;
  int counterJoke = 0;
  int counterLike = 0;
  String Content= '';

  Future<void> getJoke() async {

    joke = await  GetJoke(JokeRepositoryAPI()).getJoke();
    setState(() {

      counterJoke++;
      if (counterJoke%5 == 0 ){
        showDialog(context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Percent of liked jokes ${(100*(counterLike/counterJoke)).toInt()} %"),
              content: const Text(''),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        // showDialog(context: context, builder: (con){return S(body: Container(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Percent of liked jokes ${(100*(counterLike/counterJoke)).toInt()} %")],),));});
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('Go to Liked '),
              ),
              SafeArea(
                child: Swipe(
                  //padding: EdgeInsets.all(50),
                  child: Text('${joke.value}',
                      style:
                      new TextStyle(color: Colors.black, fontSize: 20.0)),
                  onSwipeLeft: () {
                    setState(() {
                      getJoke();
                    });
                  },
                  onSwipeRight: () async {
                    await savedLocalJoke();
                    setState(() {

                      counterLike++;
                      getJoke();
                    });
                  },


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
                      onPressed:() async { await savedLocalJoke();getJoke();counterLike++;

                        } ,
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
    getApplicationDocumentsDirectory().then((Directory dir){
      print(dir.path);
      File filePath = new File('local_joke.txt');
      bool fileEx = filePath.existsSync();
      if (fileEx){
              setState(() {
              Content = filePath.readAsStringSync();

        });
      } else{
        filePath.writeAsString("First Joke : Burationo can not swim");
      }
    });
    this.getJoke();
  }
  savedLocalJoke() async {
    var jokeBox = await Hive.openBox<JokeSaved>('jokeBox');
    JokeSaved jokeSaved = JokeSaved(joke.id, joke.url, joke.value);
    jokeBox.add(jokeSaved);
  }
}

class Count extends StatelessWidget {
  Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',
        key: Key('counterState'), style: Theme.of(context).textTheme.headline4);
  }
}

