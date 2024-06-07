List<List<int>> findSubsequences(
    List<int> arr, int index, int sum, List<int> subsequence, int M) {
  List<List<int>> result = [];
  // Nếu tổng hiện tại bằng M
  if (sum == M) {
    result.add(List<int>.from(subsequence));
  }
  // Nếu tổng hiện tại lớn hơn M hoặc đã duyệt hết mảng
  else if (index < arr.length && sum < M) {
    // Không chọn phần tử hiện tại
    result.addAll(findSubsequences(arr, index + 1, sum, subsequence, M));
    // Chọn phần tử hiện tại
    subsequence.add(arr[index]);
    result.addAll(
        findSubsequences(arr, index + 1, sum + arr[index], subsequence, M));
    subsequence.removeLast(); // Xóa phần tử vừa thêm để thử nhánh khác
  }
  return result;
}
