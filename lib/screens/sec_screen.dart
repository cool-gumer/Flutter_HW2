import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:joke/models/joke_saved_model.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../models/counter_jokes.dart';
import '../models/swipe_card.dart';

import 'package:path_provider/path_provider.dart';


class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ValueListenableBuilder(
        valueListenable: Hive.box<JokeSaved>('jokeBox').listenable(),
        builder: (context, Box<JokeSaved> box, _) {
          return Scaffold( appBar: AppBar(
            title: Text('Liked Jokes (${box.values.length})'),

          ),
          body: box.values.isEmpty?Text('Joke is empty'):ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              var joke = box.getAt(index);
              return ListTile(
                title: Text('ID: '+ joke!.id),
                subtitle: Text(joke!.value),
              );
            },
          ),);
        },
      ),

    );
  }
}