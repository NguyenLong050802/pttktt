import 'package:pttktt/question/question12/ctl/model.dart';
import 'package:pttktt/question/question2/ctl/ques2ctl.dart';

List<Question12> xepCaiTui(List<Question12> qt11 , int w) {
  List<int> index = sorttygia(qt11);
  List<Question12> selectedItems = [];
  int currentWeight = 0;
  for (int i = 0; i < index.length; i++) {
        while (currentWeight + qt11[index[i]].weight <= w) {
      currentWeight += qt11[index[i]].weight;
      selectedItems.add(qt11[index[i]]);
    }
  }
  return selectedItems;
}
// List<Question12> knapsack(List<Question12> a, int m) {
//   List<int> tygia = sorttygia(a);

//   List<Question12> selectedItems = [];
//   int currentWeight = 0;

//   for (int i = 0; i < tygia.length; i++) {
//     while (currentWeight + a[tygia[i]].weight <= m) {
//       currentWeight += a[tygia[i]].weight;
//       selectedItems.add(a[tygia[i]]);
//     }
//   }
//   return selectedItems;
// }