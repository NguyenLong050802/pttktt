import 'package:flutter/material.dart';
import 'package:pttktt/custom/custom_text_filed.dart';
import 'package:pttktt/custom/custom_textbtn.dart';

import '../ctl/qet13ctl.dart';

Widget question13(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController listCtl = TextEditingController();
  TextEditingController mController = TextEditingController();
  TextEditingController resultController = TextEditingController();
  List<int> list = [];
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
                  'Question 13 : Cho một dãy số nguyên dương (a0 ,a1 ,…,an-1 ) và một số nguyên dương M. Ta cần tìm các dãy con của dãy sao cho tổng của các phần tử trong dãy con đó bằng M. Chẳng hạn, với dãy số (7,1,4,3,5,6) và M=11, thì các dãy con cần tìm là (7,1,3), (7,4), (1,4,6) và (5,6). Thiết kế TT giải bài toán bằng phương pháp quay lu',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          MyTextField(
            controller: listCtl,
            hintText: 'Nhập vào một mảng',
            obscureText: false,
            labelText: 'Mảng số nguyên dương',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Mảng không được để trống';
              } else {
                final arr = value.split(' ');
                for (var item in arr) {
                  if (int.tryParse(item) == null || int.parse(item) <= 0) {
                    return 'Mảng phải là dãy số nguyên dương';
                  }
                }
              }
              return null;
            },
            onChanged: (value){
              resultController.text = '';
              return null;
            },
          ),
          MyTextField(
            controller: mController,
            hintText: 'Nhập vào số nguyên dương M',
            obscureText: false,
            labelText: 'M',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || int.tryParse(value) == null) {
                return 'Vui lòng nhập số M';
              } else if (int.parse(value) <= 0) {
                return 'M phải là số nguyên dương';
              }
              return null;
            },
            onChanged: (value){
              resultController.text = '';
              return null;
            },
          ),
          Center(
            child: MyTextButton(
              lable: 'Search',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  list =
                      listCtl.text.split(' ').map((e) => int.parse(e)).toList();
                  List<List<int>> result = findSubsequences(
                      list, 0, 0, [], int.parse(mController.text));
                  resultController.text = result.toString();
                  debugPrint(result.toString());
                }
              },
            ),
          ),
          MyTextField(
            controller: resultController,
            hintText: 'Damh sách kết quả',
            obscureText: false,
            labelText: 'Kết quả',
            readOnly: true,
          ),
        ],
      ),
    ),
  );
}
