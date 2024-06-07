import 'package:flutter/material.dart';

int F(int m, int v) {
  List<List<int>> arr = List.generate(100, (_) => List.filled(100, 0));
  int sum = 0;
  if (m <= v) {
    for (int i = 0; i <= v; i++) {
      for (int j = 0; j <= m; j++) {
        if (i == 0) {
          if (j == 0) {
            arr[i][j] = 1;
            sum = arr[i][j];
          } else {
            arr[i][j] = 0;
            sum = arr[i][j];
          }
        } else {
          if (i > j) {
            arr[i][j] = arr[i - 1][j];
            sum = arr[i][j];
          } else {
            arr[i][j] = arr[i][j - i] + arr[i - 1][j];
            sum = arr[i][j];
          }
        }
      }
    }
  }
  debugPrint(arr.toString());
  return sum;
}
