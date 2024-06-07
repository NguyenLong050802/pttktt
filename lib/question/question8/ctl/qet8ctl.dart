import 'package:flutter/material.dart';

int tinhgiaithuaQHD(int n) {

  List<int> factorial = [1];

  for (int i = 1; i <= n; i++) {
    factorial.add(factorial[i - 1] * i);
  }
  debugPrint(factorial.toString());
  return factorial[n];
}

int tinhgiaithuaCDT(int n) {
  if (n <= 1) {
    return 1;
  }

  int mid = n ~/ 2;

  int leftFactorial = tinhgiaithuaCDT(mid);

  int rightFactorial = factorialRange(mid + 1, n);

  return leftFactorial * rightFactorial;
}

int factorialRange(int start, int end) {
  if (start > end) {
    return 1;
  }
  if (start == end) {
    return start;
  }
  if (end - start == 1) {
    return start * end;
  }

  int mid = (start + end) ~/ 2;
  return factorialRange(start, mid) * factorialRange(mid + 1, end);
}
