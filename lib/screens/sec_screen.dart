import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/counter_jokes.dart';
import '../models/swipe_card.dart';

import 'package:path_provider/path_provider.dart';


class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Jokes (${context.watch<Counter>().count})'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${context.watch<JokesCart>().count}'),
            Text('${context.watch<JokesCart>().cart}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('addItem_floatingActionButton'),
        onPressed: () => context.read<JokesCart>().addItem("NEWJoke"),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}