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
