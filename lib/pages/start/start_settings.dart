class StartSettings {
  String category;
  Duration maxTime;
  int maxPeople;
  int goodsCounter;

  StartSettings(
      {this.category, this.maxTime, this.maxPeople, this.goodsCounter});

  bool get allFilled => ((category ?? "").isNotEmpty &&
      (maxTime != null) &&
      (maxPeople != null) &&
      (goodsCounter != null));
}
