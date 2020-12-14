import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:calibration/pages/history/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:calibration/generated/l10n.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView>
    with AutomaticKeepAliveClientMixin {
  void _getQuizes() async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/quiz/bycategory/2');

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY5NmFhNzRjODFiZTYwYjI5NDg1NWE5YTVlZTliODY5OGUyYWJlYzEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vY2FsaWJyYXRpb24tcHJpMTE3IiwiYXVkIjoiY2FsaWJyYXRpb24tcHJpMTE3IiwiYXV0aF90aW1lIjoxNjA3ODcyODM5LCJ1c2VyX2lkIjoiQjhSc2tpQWRQRVRyaFV2c09ubjhMOVNTbjlhMiIsInN1YiI6IkI4UnNraUFkUEVUcmhVdnNPbm44TDlTU245YTIiLCJpYXQiOjE2MDc4NzI4MzksImV4cCI6MTYwNzg3NjQzOSwiZW1haWwiOiJ0ZXN0QG1haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInRlc3RAbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.aHgHcsQizvcLdMNiW2ae0LRlL5oSchfbwUiMyuO6-lCD10HNRRfhrLw0C6pA13qZLx8znAC6hqxsjl27Rh7NWK8IMfqL3boM00PP7MTkc_8tQh-9AZlmp-xaYzogMs1tEfoH6CDUMZXy8m-BZSuX_NtYs-S-m1ycdDlTi3kdtj-1aNjtir78-vNx3AyPeYhfrlLtTW2w59U55TJB8Bvr8A2gEDsToRrVTYPgzlG4FDCtMMdTIBG1lafYTDNGw2YYBLm3QcaCx_rIz5m3Bz6HTXbLVMPOwZPNHfgund-q3wk0HQPNqbOPE8rKrO1jbRxyCFCD0lO9rXVCrCKrMJBy9A'
    };

    final response = await http.get(uri, headers: headers);

    log(response.body);
  }

  void _createQuiz() async {
    var params = {"QuizCategoryId": 2, "FilterType": 1};

    Uri uri = Uri.http('10.0.2.2:5000', '/api/quizgenerator/reddit');

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY5NmFhNzRjODFiZTYwYjI5NDg1NWE5YTVlZTliODY5OGUyYWJlYzEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vY2FsaWJyYXRpb24tcHJpMTE3IiwiYXVkIjoiY2FsaWJyYXRpb24tcHJpMTE3IiwiYXV0aF90aW1lIjoxNjA3ODcyODM5LCJ1c2VyX2lkIjoiQjhSc2tpQWRQRVRyaFV2c09ubjhMOVNTbjlhMiIsInN1YiI6IkI4UnNraUFkUEVUcmhVdnNPbm44TDlTU245YTIiLCJpYXQiOjE2MDc4NzI4MzksImV4cCI6MTYwNzg3NjQzOSwiZW1haWwiOiJ0ZXN0QG1haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInRlc3RAbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.aHgHcsQizvcLdMNiW2ae0LRlL5oSchfbwUiMyuO6-lCD10HNRRfhrLw0C6pA13qZLx8znAC6hqxsjl27Rh7NWK8IMfqL3boM00PP7MTkc_8tQh-9AZlmp-xaYzogMs1tEfoH6CDUMZXy8m-BZSuX_NtYs-S-m1ycdDlTi3kdtj-1aNjtir78-vNx3AyPeYhfrlLtTW2w59U55TJB8Bvr8A2gEDsToRrVTYPgzlG4FDCtMMdTIBG1lafYTDNGw2YYBLm3QcaCx_rIz5m3Bz6HTXbLVMPOwZPNHfgund-q3wk0HQPNqbOPE8rKrO1jbRxyCFCD0lO9rXVCrCKrMJBy9A'
    };

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(params));

    log(response.body);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(children: [
      RaisedButton(onPressed: () {
        // _getQuizById();
      }),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: HistoryTile(
          date: DateTime(2020, 10, 12, 12, 55),
          category: S.of(context).catAccessory,
          matches: 6,
          user1: "flamebrier",
          user2: "vvdimon",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: HistoryTile(
          date: DateTime(2020, 10, 12, 12, 55),
          category: S.of(context).catElectronic,
          matches: 8,
          user1: "flamebrier",
          user2: "vvdimon",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: HistoryTile(
          date: DateTime(2020, 10, 12, 12, 55),
          category: S.of(context).catMale,
          matches: 3,
          user1: "vvdimon",
          user2: "flamebrier",
        ),
      )
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
