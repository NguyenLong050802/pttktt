import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../question2/ctl/ques2ctl.dart';
import 'model.dart';

List<Question12> knapsack(List<Question12> a, int m) {
  List<int> tygia = sorttygia(a);

  List<Question12> selectedItems = [];
  int currentWeight = 0;

  for (int i = 0; i < tygia.length; i++) {
    if (currentWeight + a[tygia[i]].weight <= m) {
      currentWeight += a[tygia[i]].weight;
      selectedItems.add(a[tygia[i]]);
    } else {
      break;
    }
  }
  return selectedItems;
}

Future loadLocationData12(List<Question12> qt12) async {
  try {
    String data = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> jsonData = json.decode(data);
    List provinceData = jsonData['data12'];
    qt12 = provinceData.map((json) => Question12.fromMap(json)).toList();
    return qt12;
  } catch (e) {
    debugPrint('Error loading location data $e');
    return qt12;
  }
}