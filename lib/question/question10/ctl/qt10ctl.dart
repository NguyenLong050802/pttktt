void merge(List<int> arr, int l, int m, int r) {
  int n1 = m - l + 1;
  int n2 = r - m;

  // Tạo các mảng tạm
  List<int> left = [];
  List<int> right = [];

  // Copy dữ liệu sang các mảng tạm
  for (int i = 0; i < n1; i++) {
    left.add(arr[l+i]);
  }
  for (int j = 0; j < n2; j++) {
    right.add(arr[m+j+1]);
  }

  // Gộp hai mảng tạm vừa rồi vào mảng arr
  int i = 0;
  int j = 0;
  int k = l;
  while (i < n1 && j < n2) {
    if (left[i] <= right[j]) {
      arr[k] = left[i];
      i++;
    } else {
      arr[k] = right[j];
      j++;
    }
    k++;
  }

  // Copy các phần tử còn lại của mảng L vào arr nếu có
  while (i < n1) {
    arr[k] = left[i];
    i++;
    k++;
  }

  // Copy các phần tử còn lại của mảng R vào arr nếu có
  while (j < n2) {
    arr[k] = right[j];
    j++;
    k++;
  }
}

void mergeSort10(List<int> arr, int l, int r) {
  if (l < r) {
    // Tương tự (l+r)/2, nhưng cách này tránh tràn số khi l và r lớn
    int m = l + (r - l) ~/ 2;

    // Gọi hàm đệ quy tiếp tục chia đôi từng nửa mảng
    mergeSort10(arr, l, m);
    mergeSort10(arr, m + 1, r);

    merge(arr, l, m, r);
  }
}
