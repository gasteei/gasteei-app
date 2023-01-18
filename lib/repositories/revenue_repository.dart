import 'dart:math';

import 'package:gasteei/models/revenue.dart';

class RevenueRepository {
  final List<Revenue> _revenues = [];

  bool randomPositive() {
    final rand = Random();
    return rand.nextBool();
  }

  String randomLastEntry() {
    final rand = Random();
    return ["20", "1", "2", "30", "15", "27"].elementAt(rand.nextInt(6));
  }

  List<Revenue> loadRevenues() {
    _revenues.addAll([
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Janeiro"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Fevereiro"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Março"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Abril"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Maio"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Junho"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Julho"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Agosto"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Setembro"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Outubro"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Novembro"),
      Revenue(lastEntry: randomLastEntry(), isPositive: randomPositive(), value: 300, month: "Dezembro"),
    ]);
    return _revenues;
  }
}
