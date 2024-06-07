import 'package:flutter/material.dart';

Widget question14(BuildContext context) {
  final formKey = GlobalKey<FormState>();
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
                  'Question 14 :  Cho 1 bàn cờ nxn, có n 2 . Một quân mã được di chuyển tuân theo luật chơi cờ vua được đặt trên bàn cờ tại ô đầu tiên có tọa độ x0, y0. Cần tìm 1 lộ trình gồm n 2 – 1 bước sao cho nó phủ toàn bộ bàn cờ ( mỗi ô được đi qua đúng 1 lần). Thiết kế TT giải bài toán bằng phương pháp quay lui.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
