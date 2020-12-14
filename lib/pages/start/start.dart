import 'package:calibration/pages/start/categories.dart';
import 'package:calibration/pages/start/choose_start_settings.dart';
import 'package:calibration/pages/start/game.dart';
import 'package:calibration/pages/start/start_settings.dart';
import 'package:calibration/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class StartPage extends StatefulWidget {
  final StartSettings initialSettings;

  StartPage({Key key, this.initialSettings}) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with AutomaticKeepAliveClientMixin {
  StartSettings _settings = StartSettings();

  @override
  void initState() {
    super.initState();
    if (widget.initialSettings != null) {
      _settings = widget.initialSettings;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.startTitle),
      ),
      body: _chooseViewBuilder(context),
    );
  }

  Widget _chooseViewBuilder(BuildContext context) {
    if (_settings.category == null) {
      return CategoriesView(
        onChoose: (category) {
          if (mounted) {
            setState(() {
              _settings.category = category;
            });
          }
        },
      );
    }
    return ChooseStartSettings(
      initialSettings: _settings,
      onChoose: (settings) {
        if (mounted) {
          setState(() {
            _settings = settings;
          });
        }
      },
      launch: (settings) async {
        var response = await _getQuizById();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                GameView(settings: _settings, quiz: response)));
      },
    );
  }

  Future<Response> _getQuizById() async {
    Uri uri = Uri.http('10.0.2.2:5000', '/api/quiz/2');

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY5NmFhNzRjODFiZTYwYjI5NDg1NWE5YTVlZTliODY5OGUyYWJlYzEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vY2FsaWJyYXRpb24tcHJpMTE3IiwiYXVkIjoiY2FsaWJyYXRpb24tcHJpMTE3IiwiYXV0aF90aW1lIjoxNjA3ODcyODM5LCJ1c2VyX2lkIjoiQjhSc2tpQWRQRVRyaFV2c09ubjhMOVNTbjlhMiIsInN1YiI6IkI4UnNraUFkUEVUcmhVdnNPbm44TDlTU245YTIiLCJpYXQiOjE2MDc4NzI4MzksImV4cCI6MTYwNzg3NjQzOSwiZW1haWwiOiJ0ZXN0QG1haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInRlc3RAbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.aHgHcsQizvcLdMNiW2ae0LRlL5oSchfbwUiMyuO6-lCD10HNRRfhrLw0C6pA13qZLx8znAC6hqxsjl27Rh7NWK8IMfqL3boM00PP7MTkc_8tQh-9AZlmp-xaYzogMs1tEfoH6CDUMZXy8m-BZSuX_NtYs-S-m1ycdDlTi3kdtj-1aNjtir78-vNx3AyPeYhfrlLtTW2w59U55TJB8Bvr8A2gEDsToRrVTYPgzlG4FDCtMMdTIBG1lafYTDNGw2YYBLm3QcaCx_rIz5m3Bz6HTXbLVMPOwZPNHfgund-q3wk0HQPNqbOPE8rKrO1jbRxyCFCD0lO9rXVCrCKrMJBy9A'
    };

    final response = await http.get(uri, headers: headers);

    return response;
  }

  @override
  bool get wantKeepAlive => true;
}
