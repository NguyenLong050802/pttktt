import 'package:flutter/material.dart';
import 'package:pttktt/custom/custom_text_filed.dart';
import 'package:pttktt/custom/custom_textbtn.dart';
import 'package:pttktt/question/question1/ctl/quest1ctl.dart';

Widget question1(BuildContext context) {
  final inputCtl = TextEditingController();
  TextEditingController resultCtl = TextEditingController();
  final quest1 = Quest1();
  final formKey = GlobalKey<FormState>();
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              'Question 1 : Xét bài toán đổi tiền xu cho một số tiền có giá trị bằng n xu ( n nhập từ bàn phím) sao cho số đồng xu đổi ra là nhỏ nhất. Thiết kế một giải thuật tham lam để đổi tiền có dùng các đồng xu sau: 5000, 2000, 1000, 500.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: inputCtl,
            hintText: 'Nhập số tiền cần đổi',
            obscureText: false,
            labelText: 'Số tiền cần đổi',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập số tiền cần đổi';
                // } else if (int.tryParse(value) == null ||
                //     int.tryParse(value)! <= 0) {
                //   return 'Vui lòng nhập số tiền là số nguyên dương';
                // } else if (int.tryParse(value)! % 500 != 0) {
                //   return 'Vui lòng nhập số tiền là bội số của 500';
              }
              return null;
            },
            onChanged: (value) {
              resultCtl.text = '';
              return null;
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: Center(
              child: MyTextButton(
                lable: 'Đổi tiền',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    resultCtl.text = quest1.doiTien(int.parse(inputCtl.text));
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: resultCtl,
            hintText: 'Số đồng xu it nhất cần đổi',
            obscureText: false,
            labelText: 'Số đồng xu cần đổi',
            readOnly: true,
          ),
        ],
      ),
    ),
  );
}
