import 'dart:convert';

import '../models/joke_model.dart';
import 'package:http/http.dart' as http;

abstract class JokeRepository{
  Future<JokeModel> getJoke();

}

class JokeRepositoryAPI extends JokeRepository{
  @override
  Future<JokeModel> getJoke() async {
    try {
      var response = await http.get(
          Uri.parse("https://api.chucknorris.io/jokes/random"),
          headers: {"Accept": "application/json"});
      return JokeModel.fromJson(json.decode(response.body));
    }
    catch(e){
      return JokeModel([], DateTime.now(), '', '', DateTime.now(), "https://api.chucknorris.io",'Error network');
    }
  }
}

