import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class Loader {
  static final instance = Loader._();

  Loader._() {
    FirebaseAuth.instance?.authStateChanges()?.listen((user) async {
      userToken = await user.getIdToken();
    });
  }

  String userToken;

  Map<String, String> getHeaders() {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $userToken'
    };
  }

  Future<http.Response> getCategories() async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/quiz/categories');

    final response = await http.get(uri);

    return response;
  }

  Future<http.Response> getQuizById() async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/quiz/2');

    final response = await http.get(uri, headers: getHeaders());

    return response;
  }

  Future<http.Response> getQuizes() async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/quiz/bycategory/2');

    final response = await http.get(uri, headers: getHeaders());

    return response;
  }

  Future<http.Response> createQuiz() async {
    var params = {"QuizCategoryId": 2, "FilterType": 1};

    Uri uri = Uri.http('10.0.2.2:5000', '/api/quizgenerator/reddit');

    final response =
        await http.post(uri, headers: getHeaders(), body: jsonEncode(params));

    return response;
  }
}