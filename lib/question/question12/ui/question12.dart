import 'package:flutter/material.dart';
import 'package:pttktt/custom/custom_textbtn.dart';
import 'package:pttktt/question/question12/ctl/qet12ctl.dart';
import '../../../custom/custom_text_filed.dart';
import '../ctl/model.dart';

class Question12View extends StatelessWidget {
  const Question12View({super.key});

  @override
  Widget build(BuildContext context) {
    List<Question12> qt12 = [];
    TextEditingController listCtl = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
          future: loadLocationData12(qt12),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              qt12 = snapshot.data;
              listCtl.text = qt12.toString();
              return question12(context, qt12, listCtl);
            }
          }),
    );
  }
}

Widget question12(BuildContext context, List<Question12> qt12,
    TextEditingController listCtl) {
  final formKey = GlobalKey<FormState>();
  TextEditingController wCtl = TextEditingController();
  TextEditingController resultController = TextEditingController();
  TextEditingController maxWCtl = TextEditingController();
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
                  'Question 12 : Có 1 chiếc túi có thể chứa được một khối lượng w, chúng ta có n loại đồ vật được đánh số i,…, n. Mỗi đồ vật loại i (i = 1,…, n) có khối lượng ai và có giá trị ci. Chúng ta muốn sắp xếp các đồ vật vào túi để nhận được túi có giá trị lớn nhất có thể được. Giả sử mỗi loại đồ vật chỉ có một đồ vật để xếp vào túi. Hãy thiết kế thuật toán giải bài toán cái túi theo phương pháp tham lam.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          MyTextField(
            controller: wCtl,
            hintText: 'Nhập vào số trọng lượng tối đa của túi',
            obscureText: false,
            labelText: 'Trọng lượng tối đa của túi',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || int.tryParse(value) == null) {
                return 'Vui lòng nhập số M';
              } else if (int.parse(value) <= 0) {
                return 'Trọng lượng phải là số nguyên dương';
              }
              return null;
            },
            onChanged: (value) {
              resultController.text = '';
              maxWCtl.text = '';
              return null;
            },
          ),
          MyTextField(
            controller: listCtl,
            hintText: 'Dang sách đồ vật',
            obscureText: false,
            labelText: 'Danh sách đồ vật',
          ),
          Center(
            child: MyTextButton(
              lable: 'Giải',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  List<Question12> a = knapsack(qt12, int.parse(wCtl.text));
                  resultController.text = a.toString();
                  maxWCtl.text = a
                      .fold<int>(
                          0,
                          (previousValue, element) =>
                              previousValue + element.price)
                      .toString();
                  debugPrint(a.toString());
                  debugPrint(
                      'Số trọng lượng lớn nhất có thể được: ${maxWCtl.text}');
                }
              },
            ),
          ),
          MyTextField(
            controller: resultController,
            hintText: 'Dang sách đồ vật',
            obscureText: false,
            labelText: 'Danh sách đồ vật',
          ),
          MyTextField(
            controller: maxWCtl,
            hintText: 'Giá trị lớn nhất có thể được',
            obscureText: false,
            labelText: 'Giá trị lớn nhất có thể được',
          ),
        ],
      ),
    ),
  );
}
