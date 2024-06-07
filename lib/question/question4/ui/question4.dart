import 'package:flutter/material.dart';
import 'package:pttktt/question/question4/ctl/qet4ctl.dart';
import '../../../custom/custom_text_filed.dart';
import '../../../custom/custom_textbtn.dart';

Widget question4(BuildContext context) {
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
                  'Question 4 :  Thiết kế thuật toán tìm dãy con liên tiếp có tổng lớn nhất theo phương pháp chia để trị.',
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
              lable: 'Tính tổng dãy con lớn nhất',
              width: 300,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  list = controller.text
                      .split(' ')
                      .map((e) => int.parse(e))
                      .toList();
                  firstCtl.text = list.toString();
                  int a = maxSubarraySum(list, 0, list.length - 1);
                  resultCtl.text = a.toString();
                  debugPrint(a.toString());
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
            hintText: 'Tổng dãy con lớn nhất',
            obscureText: false,
            labelText: 'Kêt quả',
            readOnly: true,
          ),
        ],
      ),
    ),
  );
}
