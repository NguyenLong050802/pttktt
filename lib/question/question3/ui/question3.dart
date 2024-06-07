import 'package:flutter/material.dart';
import 'package:pttktt/custom/custom_text_filed.dart';
import 'package:pttktt/custom/custom_textbtn.dart';
import 'package:pttktt/question/question3/ctl/qet3ctl.dart';
import '../ctl/model.dart';

class Question3View extends StatefulWidget {
  const Question3View({super.key});

  @override
  State<Question3View> createState() => _Question3ViewState();
}

class _Question3ViewState extends State<Question3View> {
  List<Question3> a = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadLocationData3(a),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return question3(context, snapshot.data!);
          }
        },
      ),
    );
  }
}

Widget question3(BuildContext context, List<Question3> qt3) {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
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
                  'Question 3 : Cho 9 hoạt động với thời điểm bắt đầu và thời điểm kết thúc của chúng như sau:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    child: DataTable(
                      dataTextStyle: const TextStyle(fontSize: 20),
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
                        DataColumn(label: Text('i')),
                        DataColumn(label: Text('1')),
                        DataColumn(label: Text('2')),
                        DataColumn(label: Text('3')),
                        DataColumn(label: Text('4')),
                        DataColumn(label: Text('5')),
                        DataColumn(label: Text('6')),
                        DataColumn(label: Text('7')),
                        DataColumn(label: Text('8')),
                        DataColumn(label: Text('9')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('S')),
                          DataCell(Text('1')),
                          DataCell(Text('3')),
                          DataCell(Text('4')),
                          DataCell(Text('2')),
                          DataCell(Text('6')),
                          DataCell(Text('4')),
                          DataCell(Text('10')),
                          DataCell(Text('12')),
                          DataCell(Text('11')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('F')),
                          DataCell(Text('3')),
                          DataCell(Text('4')),
                          DataCell(Text('6')),
                          DataCell(Text('8')),
                          DataCell(Text('10')),
                          DataCell(Text('13')),
                          DataCell(Text('14')),
                          DataCell(Text('15')),
                          DataCell(Text('16')),
                        ]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Hãy áp dụng giải thuật tham lam để giải bài toán xếp lịch của các hoạt động trên',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          Center(
            child: MyTextButton(
              lable: 'Xếp lịch',
              onPressed: () {
                String result = printMaxActivities(qt3);
                controller.text = result;
              },
            ),
          ),
          MyTextField(
            controller: controller,
            hintText: 'Kết quả',
            obscureText: false,
            labelText: 'Lịch hoạt động',
          ),
        ],
      ),
    ),
  );
}
