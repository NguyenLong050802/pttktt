import 'package:flutter/material.dart';
import 'package:pttktt/custom/custom_text_filed.dart';
import 'package:pttktt/custom/custom_textbtn.dart';
import 'package:pttktt/question/question2/ctl/ques2ctl.dart';
import '../ctl/model.dart';

class Question2View extends StatefulWidget {
  const Question2View({super.key});

  @override
  State<Question2View> createState() => _Question2ViewState();
}

class _Question2ViewState extends State<Question2View> {
  List<Question2> a = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadLocationData(a),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return question2(context, snapshot.data!);
          }
        },
      ),
    );
  }
}

Widget question2(BuildContext context, List<Question2> a) {
  final formKey = GlobalKey<FormState>();
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
                  'Question 2 : Áp dụng giải thuật tham lam để giải bài toán cái túi dạng phân số với các thông tin về trọn lượng mặt hàng như sau:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                DataTable(
                  dataTextStyle: const TextStyle(fontSize: 25),
                  headingTextStyle: const TextStyle(fontSize: 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                      left: BorderSide(width: 1),
                      right: BorderSide(width: 1),
                    ),
                  ),
                  columns: const [
                    DataColumn(label: Text('Mặt hàng')),
                    DataColumn(label: Text('Trọng lượng')),
                    DataColumn(label: Text('Giá trị')),
                  ],
                  rows: const [
                    DataRow(selected: true, cells: [
                      DataCell(Text('A')),
                      DataCell(Text('18')),
                      DataCell(Text('25')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('B')),
                      DataCell(Text('15')),
                      DataCell(Text('24')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('C')),
                      DataCell(Text('10')),
                      DataCell(Text('25')),
                    ]),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Giả sử sức chứa về trọng lượng của cái túi là M=20 ( giả sử mỗi loại đồ vật chỉ có 1 thứ)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          Center(
            child: MyTextButton(
              lable: 'Giải',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  double result = phanSoCaiTui(a, 20);
                  resultCtl.text = result.toString();
                  debugPrint('Kết quả: $result');
                }
              },
            ),
          ),
          MyTextField(
            controller: resultCtl,
            hintText: 'Số giá trị tối đa',
            obscureText: false,
            labelText: 'Số giá trị tối đa',
          ),
        ],
      ),
    ),
  );
}
