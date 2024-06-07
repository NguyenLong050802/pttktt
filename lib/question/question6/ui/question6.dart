import 'package:flutter/material.dart';
import 'package:pttktt/custom/custom_text_filed.dart';
import 'package:pttktt/custom/custom_textbtn.dart';

import '../ctl/qt6ctl.dart';

Widget question6(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController x0Controller = TextEditingController();
  final qt8 = Qt6ctl();
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Column(
              children: [
                Text(
                  'Question 6 : Cần đặt 8 con hậu vào bàn cờ 8x8 sao cho chúng không tấn công nhau, (không có hai con hậu nào nằm cùng hàng, hoặc cùng cột, hoặc cùng đường chéo).Thiết kế thuật toán giải bài toán xếp tám hậu theo phương pháp quay lui. ( Thực hiện từng bước việc đặt 5, 6, 7 con hậu đầu tiên trên bàn cờ 8x8)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: x0Controller,
            hintText: 'Nhập vào tọa độ quân hậu ban đầu',
            obscureText: false,
            labelText: 'X0',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Không được để trống';
              } else if (int.tryParse(value) == null) {
                return 'Nhập vào số nguyên';
              } else if (int.tryParse(value)! < 0 || int.tryParse(value)! > 7) {
                return 'Nhập vào số từ 0 đến 7';
              }
              return null;
            },
          ),
          Center(
            child: MyTextButton(
              lable: 'Giải',
              onPressed: () {
                int x0 = int.parse(x0Controller.text);
                if (formKey.currentState!.validate()) {
                  qt8.solveNQueensWithInitialPosition(0, x0);
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}
