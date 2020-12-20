import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:calibration/data/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class Loader {
  static final instance = Loader._();

  Loader._() {
    FirebaseAuth.instance?.authStateChanges()?.listen((user) async {
      userToken = await user?.getIdToken();
    });
  }

  init() async {
    userToken = await FirebaseAuth.instance?.currentUser?.getIdToken();
  }

  Profile currentProfile;

  String userToken;

  Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $userToken'
      };

  Future<http.Response> getUser() async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/users/getprofile');
    final response = await http.get(uri, headers: headers);

    return response;
  }

  Future<http.Response> setUserNick(String newNick) async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/users/changenick');

    var params = {"value": newNick};

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(params));

    return response;
  }

  Future<http.Response> getCategories() async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/quiz/categories');

    final response = await http.get(uri);

    return response;
  }

  Future<http.Response> getQuizById() async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/quiz/2');

    final response = await http.get(uri, headers: headers);

    return response;
  }

  Future<http.Response> getQuizes(int catId) async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/quiz/bycategory/$catId');

    final response = await http.get(uri);

    return response;
  }

  Future<http.Response> createCategory(String name) async {
    var params = {"BaseCategoryId": 0, "Name": name};

    Uri uri = Uri.http('10.0.2.2:5000', '/api/quizgenerator/addcategory');

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(params));

    return response;
  }

  Future<http.Response> createQuiz(int catId, FilterTypes ft) async {
    var params = {
      "QuizCategoryId": catId,
      "FilterType": ft.index,
      "TopFilter": null
    };
    // var params = {"QuizCategoryId": 1, "FilterType": 1, "TopFilter": null};

    log(params.toString());

    Uri uri = Uri.http('10.0.2.2:5000', '/api/quizgenerator/reddit');

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(params));

    log(response.body.toString());
    return response;
  }

  Future<http.Response> createSession(
      StartSettings settings, int quizId) async {
    var params = {
      "maxPlayersCount": settings.maxPeople ?? 2,
      "gameSessionTimeInMinutes": settings.maxTime.inMinutes ?? 10,
      "countOfElementsToChoose": settings.goodsCounter ?? 10
    };

    Uri uri = Uri.http('10.0.2.2:5000', '/api/session/create/$quizId');

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(params));

    return response;
  }

  Future<http.Response> joinSession(int sessionId) async {
    var params = {"Value": sessionId};

    Uri uri = Uri.http('10.0.2.2:5000', '/api/session/join');

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(params));

    return response;
  }
}
