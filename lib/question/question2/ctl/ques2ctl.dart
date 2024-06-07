import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pttktt/question/question2/ctl/model.dart';

List<int> sorttygia(List a) {
  List b = [];
  List<int> c = [];
  for (int i = 0; i < a.length; i++) {
    a[i].per = a[i].price / a[i].weight;
    b.add(a[i].per);
    c.add(i);
  }
  // for (int i = 0; i < a.length; i++) {
  //   for (int j = 0; j < a.length; j++) {
  //     if (a[i].per > a[j].per) {
  //       var temp = a[i];
  //       a[i] = a[j];
  //       a[j] = temp;
  //     }
  //   }
  // }

  mergeSort(b, c);
  return c;
}

double phanSoCaiTui(List<Question2> a, int m) {
  List<int> tygia = sorttygia(a);
  int w = 0;
  double price = 0;
  for (int i = 0; i < a.length; i++) {
    if (w + a[tygia[i]].weight <= m) {
      w += a[tygia[i]].weight;
      price += a[tygia[i]].price;
    } else {
      price += a[tygia[i]].per * (m - w);
      break;
    }
  }
  return price;
}

Future loadLocationData(List<Question2> qt2) async {
  try {
    String data = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> jsonData = json.decode(data);
    List provinceData = jsonData['data2'];
    qt2 = provinceData.map((json) => Question2.fromMap(json)).toList();
    return qt2;
  } catch (e) {
    debugPrint('Error loading location data $e');
    return qt2;
  }
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
  merge(left, right, list, leftIndices, rightIndices, indices);
}

void merge(List left, List right, List list, List<int> leftIndices,
    List<int> rightIndices, List<int> indices) {
  int i = 0, j = 0, k = 0;
  while (i < left.length && j < right.length) {
    if (left[i] >= right[j]) {
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
