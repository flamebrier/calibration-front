import 'package:calibration/generated/l10n.dart';

class Profile {
  String id;
  String nickName;
  String name;
  String photoUrl;
  List<UserRole> roles;
}

class UserRole {
  int id;
  String userId;
  String roleId;

  @override
  String toString() {
    return roleId;
  }
}

Map<String, String> catNames = {
  "pics": S.current.catPics,
  "memes": S.current.catMemes,
  "Reddit": S.current.catReddit,
};

class Category {
  int id;
  String name;
  int baseCategoryId;
}

class StartSettings {
  Category category;
  Duration maxTime;
  int maxPeople;
  int goodsCounter;

  StartSettings(
      {this.category, this.maxTime, this.maxPeople, this.goodsCounter});

  bool get allFilled => ((category?.name ?? "").isNotEmpty &&
      (maxTime != null) &&
      (maxPeople != null) &&
      (goodsCounter != null));
}

Map<FilterTypes, String> filterNames = {
  FilterTypes.hot: S.current.filterHot,
  FilterTypes.newest: S.current.filterNew,
  FilterTypes.top: S.current.filterTop
};

enum FilterTypes { hot, newest, top }

class QuizSettings {
  int id;
  bool topFilter;
  int filterTypeId;
}

class Post {
  int id;
  String title;
  String pictureUrl;

  @override
  String toString() {
    return "id: $id, title: $title, pic: $pictureUrl\n";
  }
}

class Quiz {
  int id;
  QuizSettings settings;
  int categoryId;
  DateTime dateOfCreation;
  int countOfQuestions;
  List<Post> questions;
}

class Session {
  int id;
  StartSettings settings;
  Quiz quiz;
  DateTime dateOfCreation;
  int creatorId;
  List<Participant> participants;
}

class Participant {
  int id;
  String userId;
  Profile user;
  DateTime dateOfStart;
  DateTime dateOfEnd;
  var questionsAndAnswers;
}
