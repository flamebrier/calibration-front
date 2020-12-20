import 'dart:convert';

import 'package:calibration/data/models.dart';
import 'package:http/http.dart';

class Serializator {
  static final instance = Serializator._();

  Serializator._();

  Session createSessionFromResponse(Response response) {
    final body = json.decode(response.body);
    final jsonQuiz = body["Quiz"];
    List<Post> questions = List<Post>();
    for (final e in jsonQuiz["Questions"]) {
      questions.add(Post()
        ..id = e["Id"]
        ..title = e["Title"]
        ..pictureUrl = e["PictureUrl"]);
    }
    Quiz _quiz = Quiz()
      ..categoryId = jsonQuiz["QuizCategory"]["Id"]
      ..id = jsonQuiz["Id"]
      ..countOfQuestions = jsonQuiz["CountOfQuestions"]
      ..dateOfCreation = DateTime.parse(body["DateOfCreation"])
      ..settings = (QuizSettings()
        ..id = jsonQuiz["QuizSettings"]["Id"]
        ..filterTypeId = jsonQuiz["QuizSettings"]["FilterType"]
        ..topFilter = jsonQuiz["QuizSettings"]["TopFilter"])
      ..questions = questions;
    StartSettings _settings = StartSettings()
      ..category = (Category()
        ..id = jsonQuiz["QuizCategory"]["Id"]
        ..name = jsonQuiz["QuizCategory"]["Name"]
        ..baseCategoryId = jsonQuiz["QuizCategory"]["BaseQuizCategory"])
      ..maxPeople = body["GameSessionSettings"]["MaxPlayersCount"]
      ..goodsCounter = body["GameSessionSettings"]["CountOfElementsToChoose"]
      ..maxTime = Duration(
          minutes: body["GameSessionSettings"]["GameSessionTimeInMinutes"]);
    return Session()
      ..id = body["Id"]
      ..creatorId = body["CreatorId"]
      ..dateOfCreation = DateTime.parse(body["DateOfCreation"])
      ..settings = _settings
      ..quiz = _quiz;
  }
}
