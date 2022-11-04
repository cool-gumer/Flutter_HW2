import 'package:joke/repositories/joke_repository.dart';

import '../models/joke_model.dart';

class GetJoke{
  final JokeRepository jokeRepository;
  GetJoke(this.jokeRepository);
  Future<JokeModel> getJoke() async{
    return jokeRepository.getJoke();
  }
}