void main() {
  int n = 8; // Kích thước bàn cờ nxn
  int x0 = 0, y0 = 0; // Vị trí bắt đầu của quân mã
  solveKnightTour(n, x0, y0);
}

bool isValidMove(int x, int y, List<List<int>> board, int n) {
  return x >= 0 && y >= 0 && x < n && y < n && board[x][y] == -1;
}

void printBoard(List<List<int>> board, int n) {
  for (var row in board) {
    print(row.map((cell) => cell.toString().padLeft(2, '0')).join(' '));
  }
}

void solveKnightTour(int n, int x0, int y0) {
  // Các bước di chuyển của quân mã
  List<int> moveX = [2, 1, -1, -2, -2, -1, 1, 2];
  List<int> moveY = [1, 2, 2, 1, -1, -2, -2, -1];

  // Khởi tạo bàn cờ
  List<List<int>> board = List.generate(n, (_) => List.filled(n, -1));
  board[x0][y0] = 0; // Bước đầu tiên

  if (!solveKnightTourUtil(board, n, x0, y0, 1, moveX, moveY)) {
    print("Giải pháp không tồn tại");
  } else {
    printBoard(board, n);
  }
}

bool solveKnightTourUtil(List<List<int>> board, int n, int currX, int currY,
    int moveCount, List<int> moveX, List<int> moveY) {
  // Nếu tất cả các ô đã được đi qua
  if (moveCount == n * n) {
    return true;
  }

  // Kiểm tra tất cả các bước di chuyển tiếp theo
  for (int i = 0; i < 8; i++) {
    int nextX = currX + moveX[i];
    int nextY = currY + moveY[i];
    if (isValidMove(nextX, nextY, board, n)) {
      board[nextX][nextY] = moveCount;
      if (solveKnightTourUtil(
          board, n, nextX, nextY, moveCount + 1, moveX, moveY)) {
        return true;
      }
      // Backtracking
      board[nextX][nextY] = -1;
    }
  }
  return false;
}
