import 'package:flutter/material.dart';

Widget question7(BuildContext context) {
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
                  'Question 7 : Áp dụng giải thuật tham lam để giải bài toán cái túi dạng phân số với các thông tin về trọn lượng mặt hàng như sau:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                DataTable(
                  dataTextStyle: const TextStyle(fontSize: 25),
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
                    DataRow(cells: [
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
        ],
      ),
    ),
  );
}
