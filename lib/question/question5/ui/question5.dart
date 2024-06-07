import 'package:flutter/material.dart';
import 'package:pttktt/custom/custom_text_filed.dart';
import 'package:pttktt/custom/custom_textbtn.dart';
import '../ctl/qt5ctl.dart';

Widget question5(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController mController = TextEditingController();
  TextEditingController vController = TextEditingController();
  TextEditingController resultController = TextEditingController();
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
                  'Question 5 : Cho số tự nhiên n < 100. Hãy cho biết có bao nhiêu cách phân tích số n thành tổng của dãy các số nguyên dương (các cách phân tích là hoán vị của nhau chỉ tính là một cách). Thiết kế giải thuật theo phương pháp quy hoạch động, tìm công thức truy hồi, lập bảng và tính.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'v : Số tự nhiên nhỏ hơn 100 cần phân tích',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'm : điều kiện để phân tích v',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'F(m,v) : số cách phân tích v thành tổng của dãy các số nguyên dương nhỏ hơn hoăc bằng m',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )),
              ],
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: mController,
            hintText: 'Nhập vào m',
            obscureText: false,
            labelText: 'm',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || int.tryParse(value) == null) {
                return 'Vui lòng nhập số m';
              }
              return null;
            },
            onChanged: (p0) {
              resultController.text = '';
              return null;
            },
          ),
          MyTextField(
            controller: vController,
            hintText: 'Nhập vào v',
            obscureText: false,
            labelText: 'v',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || int.tryParse(value) == null) {
                return 'Vui lòng nhập số v';
              } else if (int.parse(value) < 0 || int.parse(value) >= 100) {
                return 'Vui lòng nhập m từ 0 đến 99';
              }
              return null;
            },
            onChanged: (p0) {
              resultController.text = '';
              return null;
            },
          ),
          Center(
            child: MyTextButton(
              lable: 'Tính',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  int m = int.parse(mController.text);
                  int v = int.parse(vController.text);
                  int result = F(m, v);
                  resultController.text = 'F($m , $v) = $result';
                  debugPrint('F($m , $v) = $result');
                }
              },
            ),
          ),
          MyTextField(
            controller: resultController,
            hintText: 'Kết quả',
            obscureText: false,
            labelText: 'Kết quả',
            readOnly: true,
          ),
        ],
      ),
    ),
  );
}
