import 'package:flutter/material.dart';

class Qt6ctl {
  static const int n = 8;
  List<List<int>> board = List.generate(n, (_) => List<int>.filled(n, 0));
  List<List<List<int>>> solutions = [];

  bool check(int row, int col) {
    // Kiểm tra cột
    for (int i = 0; i < row; i++) {
      if (board[i][col] == 1) {
        return false;
      }
    }

    // Kiểm tra đường chéo trái
    for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
      if (board[i][j] == 1) {
        return false;
      }
    }

    // Kiểm tra đường chéo phải
    for (int i = row - 1, j = col + 1; i >= 0 && j < n; i--, j++) {
      if (board[i][j] == 1) {
        return false;
      }
    }

    return true;
  }

  void printBoard() {
    for (int i = 0; i < solutions.length; i++) {
      debugPrint("Solution $i:");
      for (int j = 0; j < n; j++) {
        debugPrint(solutions[i][j].toString());
      }
    }
  }

  void queen(int row) {
    if (row == n) {
      solutions.add(board.map((row) => List<int>.from(row)).toList());
      printBoard();

      return;
    }

    for (int col = 0; col < n; col++) {
      // Duyệt từng vị trí trên hàng
      if (check(row, col)) {
        // Nếu vị trí đó không xung đột với những quân hậu khác
        board[row][col] = 1; // Thực hiện đặt quân hậu vào vị trí
        queen(row + 1); // Đệ quy để đặt quân hậu tiếp theo
        board[row][col] = 0;
      }
    }
  }

  void solveNQueensWithInitialPosition(int initialRow, int initialCol) {
    if (initialRow < 0 ||
        initialRow >= n ||
        initialCol < 0 ||
        initialCol >= n) {
      debugPrint("Vị trí quân hậu đầu tiên không hợp lệ");
      return;
    } else {
      board[initialRow][initialCol] = 1;
      queen(initialRow + 1);
    }
  }
}
