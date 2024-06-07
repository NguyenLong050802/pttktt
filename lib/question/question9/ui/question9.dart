import 'package:flutter/material.dart';

import '../../../custom/custom_text_filed.dart';
import '../../../custom/custom_textbtn.dart';
import '../ctl/qet9ctl.dart';

Widget question9(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController firstCtl = TextEditingController();
  TextEditingController resultCtl = TextEditingController();
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
                  'Question 9 : Cho dãy số nguyên A có n phần tử cần được sắp xếp thành dãy số không giảm theo phương pháp sắp sếp nhanh QuickSort. Hãy thiết kế thuật toán sắp xếp theo phương pháp chia để trị.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          MyTextField(
            controller: controller,
            hintText: 'Nhập vào một mảng',
            obscureText: false,
            labelText: 'Nhậo mảng',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Mảng không được để trống';
              } else {
                final arr = value.split(' ');
                for (var item in arr) {
                  if (int.tryParse(item) == null) {
                    return 'Mảng phải là dãy số nguyên';
                  }
                }
              }
              return null;
            },
            onChanged: (value) {
              firstCtl.text = '';
              resultCtl.text = '';
              return null;
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: MyTextButton(
              lable: 'Sắp xếp',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  list = controller.text
                      .split(' ')
                      .map((e) => int.parse(e))
                      .toList();
                  firstCtl.text = list.toString();
                  quickSort(list, 0, list.length - 1);
                  resultCtl.text = list.toString();
                  debugPrint(list.toString());
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: firstCtl,
            hintText: 'Mảng vừa nhập',
            obscureText: false,
            labelText: 'Mảng ban đầu',
            readOnly: true,
          ),
          MyTextField(
            controller: resultCtl,
            hintText: 'Mảng sau khi sắo xếp',
            obscureText: false,
            labelText: 'Mảng sau khi sắp xếp',
            readOnly: true,
          ),
        ],
      ),
    ),
  );
}
