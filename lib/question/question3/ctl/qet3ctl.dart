import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model.dart';

List<Question3> sortByEndTime(List<Question3> qt3) {
  List<int> endTimes = [];
  List<int> indices = [];
  for (int i = 0; i < qt3.length; i++) {
    endTimes.add(qt3[i].end);
    indices.add(i);
  }
  mergeSort(endTimes, indices);
  List<Question3> sortedList = [];
  for (int i = 0; i < qt3.length; i++) {
    sortedList.add(qt3[indices[i]]);
  }
  return sortedList;
}

String printMaxActivities(List<Question3> qt3) {
  List<Question3> sortedList = sortByEndTime(qt3);
  debugPrint(sortedList.toString());
  int i = 0;
  String result = '(${sortedList[i].start}, ${sortedList[i].end})';
  debugPrint('(${sortedList[i].start}, ${sortedList[i].end})');
  for (int j = 1; j < sortedList.length; j++) {
    if (sortedList[j].start >= sortedList[i].end) {
      result += ', (${sortedList[j].start}, ${sortedList[j].end})';
      debugPrint('(${sortedList[j].start}, ${sortedList[j].end})');
      i = j;
    }
  }
  return result;
}


void mergeSort(List list, List<int> indices) {
  if (list.length <= 1) return;

  int mid = list.length ~/ 2;
  List left = list.sublist(0, mid);
  List right = list.sublist(mid, list.length);
  List<int> leftIndices = indices.sublist(0, mid);
  List<int> rightIndices = indices.sublist(mid, list.length);

  mergeSort(left, leftIndices);
  mergeSort(right, rightIndices);
  mergeUp(left, right, list, leftIndices, rightIndices, indices);
}

void mergeUp(List left, List right, List list, List<int> leftIndices,
    List<int> rightIndices, List<int> indices) {
  int i = 0, j = 0, k = 0;
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      list[k] = left[i];
      indices[k] = leftIndices[i];
      i++;
    } else {
      list[k] = right[j];
      indices[k] = rightIndices[j];
      j++;
    }
    k++;
  }

  while (i < left.length) {
    list[k] = left[i];
    indices[k] = leftIndices[i];
    i++;
    k++;
  }

  while (j < right.length) {
    list[k] = right[j];
    indices[k] = rightIndices[j];
    j++;
    k++;
  }
}


Future loadLocationData3(List<Question3> qt3) async {
  try {
    String data = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> jsonData = json.decode(data);
    List provinceData = jsonData['data3'];
    qt3 = provinceData.map((json) => Question3.fromMap(json)).toList();
    return qt3;
  } catch (e) {
    debugPrint('Error loading location data $e');
    return qt3;
  }
}