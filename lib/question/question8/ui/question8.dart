import 'package:flutter/material.dart';
import 'package:pttktt/question/question8/ctl/qet8ctl.dart';

import '../../../custom/custom_text_filed.dart';
import '../../../custom/custom_textbtn.dart';

Widget question8(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController resultCtl = TextEditingController();
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
                  'Question 8 : Thiết kế giải thuật tính n! Theo 2 phương pháp: chia để trị và quy hoạch động.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          MyTextField(
            controller: controller,
            hintText: 'Nhập n',
            obscureText: false,
            labelText: 'Nhập n',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || int.tryParse(value) == null) {
                return 'Vui lòng nhập một số';
              } else if (int.parse(value) < 0) {
                return 'Vui lòng nhập một số nguyên dương';
              }
              return null;
            },
            onChanged: (value) {
              resultCtl.text = '';
              return null;
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextButton(
                lable: 'Tính giai thừa bằng chia để trị',
                maxLines: 2,
                height: 100,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    int b = tinhgiaithuaCDT(int.parse(controller.text));
                    resultCtl.text = b.toString();
                    debugPrint(b.toString());
                  }
                },
              ),
              MyTextButton(
                lable: 'Tính giai thừa bằng quy hoạch động',
                height: 100,
                maxLines: 2,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    int a = tinhgiaithuaQHD(int.parse(controller.text));
                    resultCtl.text = a.toString();
                    debugPrint(a.toString());
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: resultCtl,
            hintText: 'n! =',
            obscureText: false,
            labelText: 'Kết quả',
            readOnly: true,
          ),
        ],
      ),
    ),
  );
}
