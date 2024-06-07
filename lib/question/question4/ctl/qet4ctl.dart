import 'dart:math';

int maxCrossingSum(List<int> arr, int low, int mid, int high) {
  int sum = 0;
  int leftSum = arr[mid]; // Khởi tạo leftSum với phần tử giữa

  for (int i = mid; i >= low; i--) {
    sum += arr[i];
    if (sum > leftSum) {
      leftSum = sum;
    }
  }

  sum = 0;
  int rightSum = arr[mid + 1]; // Khởi tạo rightSum với phần tử sau phần tử giữa

  for (int i = mid + 1; i <= high; i++) {
    sum += arr[i];
    if (sum > rightSum) {
      rightSum = sum;
    }
  }

  return leftSum + rightSum;
}

int maxSubarraySum(List<int> arr, int low, int high) {
  if (low == high) {
    return arr[low];
  }

  int mid = (low + high) ~/ 2;

  return max(
    maxSubarraySum(arr, low, mid),
    max(
      maxSubarraySum(arr, mid + 1, high),
      maxCrossingSum(arr, low, mid, high),
    ),
  );
}


