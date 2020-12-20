// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Calibration`
  String get title {
    return Intl.message(
      'Calibration',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get startTitle {
    return Intl.message(
      'Start',
      name: 'startTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose category`
  String get startCategorySuggestion {
    return Intl.message(
      'Choose category',
      name: 'startCategorySuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Pictures`
  String get catPics {
    return Intl.message(
      'Pictures',
      name: 'catPics',
      desc: '',
      args: [],
    );
  }

  /// `Memes`
  String get catMemes {
    return Intl.message(
      'Memes',
      name: 'catMemes',
      desc: '',
      args: [],
    );
  }

  /// `Reddit`
  String get catReddit {
    return Intl.message(
      'Reddit',
      name: 'catReddit',
      desc: '',
      args: [],
    );
  }

  /// `Enter existing session`
  String get startAlready {
    return Intl.message(
      'Enter existing session',
      name: 'startAlready',
      desc: '',
      args: [],
    );
  }

  /// `If you already have session code, enter it here`
  String get startAlreadyLong {
    return Intl.message(
      'If you already have session code, enter it here',
      name: 'startAlreadyLong',
      desc: '',
      args: [],
    );
  }

  /// `Maximum game time`
  String get startMaxTime {
    return Intl.message(
      'Maximum game time',
      name: 'startMaxTime',
      desc: '',
      args: [],
    );
  }

  /// `Maximum people playing`
  String get startMaxPeople {
    return Intl.message(
      'Maximum people playing',
      name: 'startMaxPeople',
      desc: '',
      args: [],
    );
  }

  /// `How much goods you'll choose?`
  String get startGoodsCounter {
    return Intl.message(
      'How much goods you\'ll choose?',
      name: 'startGoodsCounter',
      desc: '',
      args: [],
    );
  }

  /// `Login code`
  String get startLinkInfo {
    return Intl.message(
      'Login code',
      name: 'startLinkInfo',
      desc: '',
      args: [],
    );
  }

  /// `Time left`
  String get launchTimeLeft {
    return Intl.message(
      'Time left',
      name: 'launchTimeLeft',
      desc: '',
      args: [],
    );
  }

  /// `Left to choose`
  String get launchChooseLeft {
    return Intl.message(
      'Left to choose',
      name: 'launchChooseLeft',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message(
      'Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get profileId {
    return Intl.message(
      'Email',
      name: 'profileId',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get profileNickname {
    return Intl.message(
      'Nickname',
      name: 'profileNickname',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get profileName {
    return Intl.message(
      'Name',
      name: 'profileName',
      desc: '',
      args: [],
    );
  }

  /// `You are not authorized. Want to sign in?`
  String get profileSuggest {
    return Intl.message(
      'You are not authorized. Want to sign in?',
      name: 'profileSuggest',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get historyTitle {
    return Intl.message(
      'History',
      name: 'historyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statsTitle {
    return Intl.message(
      'Statistics',
      name: 'statsTitle',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes0 {
    return Intl.message(
      'minutes',
      name: 'minutes0',
      desc: '',
      args: [],
    );
  }

  /// `minute`
  String get minutes1 {
    return Intl.message(
      'minute',
      name: 'minutes1',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes2 {
    return Intl.message(
      'minutes',
      name: 'minutes2',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes3 {
    return Intl.message(
      'minutes',
      name: 'minutes3',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes5 {
    return Intl.message(
      'minutes',
      name: 'minutes5',
      desc: '',
      args: [],
    );
  }

  /// `nobody finished`
  String get peopleIn0 {
    return Intl.message(
      'nobody finished',
      name: 'peopleIn0',
      desc: '',
      args: [],
    );
  }

  /// `solo game`
  String get peopleIn1 {
    return Intl.message(
      'solo game',
      name: 'peopleIn1',
      desc: '',
      args: [],
    );
  }

  /// `duo game`
  String get peopleIn2 {
    return Intl.message(
      'duo game',
      name: 'peopleIn2',
      desc: '',
      args: [],
    );
  }

  /// `people finished`
  String get peopleIn3 {
    return Intl.message(
      'people finished',
      name: 'peopleIn3',
      desc: '',
      args: [],
    );
  }

  /// `people finished`
  String get peopleIn5 {
    return Intl.message(
      'people finished',
      name: 'peopleIn5',
      desc: '',
      args: [],
    );
  }

  /// `matches`
  String get matches0 {
    return Intl.message(
      'matches',
      name: 'matches0',
      desc: '',
      args: [],
    );
  }

  /// `match`
  String get matches1 {
    return Intl.message(
      'match',
      name: 'matches1',
      desc: '',
      args: [],
    );
  }

  /// `matches`
  String get matches2 {
    return Intl.message(
      'matches',
      name: 'matches2',
      desc: '',
      args: [],
    );
  }

  /// `matches`
  String get matches3 {
    return Intl.message(
      'matches',
      name: 'matches3',
      desc: '',
      args: [],
    );
  }

  /// `matches`
  String get matches5 {
    return Intl.message(
      'matches',
      name: 'matches5',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}