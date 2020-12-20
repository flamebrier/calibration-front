import 'package:calibration/generated/l10n.dart';

class Profile {
  String id;
  String nickName;
  String name;
  String photoUrl;
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

class Quiz {
  int id;
  QuizSettings settings;
  int categoryId;
  DateTime dateOfCreation;
  int countOfQuestions;
}
