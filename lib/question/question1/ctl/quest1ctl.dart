import 'package:flutter/material.dart';

class Quest1 {
  String doiTien(int tien) {
    List<int> dongxu = [5000, 2000, 1000, 500];
    String result = '';
    List<int> count = [];
    if (tien < 500) {
      result = 'Số tiền không đủ để đổi';
    } else if (tien % 500 != 0) {
      result = 'Số tiền cần đổi phải là bội số của 500';
    } else {
      for (int i = 0; i < dongxu.length; i++) {
        count.add(tien ~/ dongxu[i]);
        tien = tien % dongxu[i];
      }
      for (int i = 0; i < dongxu.length; i++) {
        debugPrint('Số đồng xu cần đổi là : ${count[i]} đồng xu ${dongxu[i]}');
        if (count[i] != 0) {
          result += '${count[i]} đồng xu ${dongxu[i]}, ';
        }
      }
    }
    return result;
  }
}
