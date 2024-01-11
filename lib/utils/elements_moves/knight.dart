List<Map<String, int>> knight(List<List<Map<String, dynamic>>> chessDataApi,
    int row, int col, String color) {
  List<Map<String, int>> l = [];

  int i = 0;
  int j = 0;

  // L 180 rotated move
  if (row > 1) {
    if (col < 7) {
      i = row - 2;
      j = col + 1;
      _applyingCondition(chessDataApi, l, i, j, row, col);
    }
  }
// L downward move

  if (row < 6) {
    if (col < 7) {
      i = row + 2;
      j = col + 1;
      _applyingCondition(chessDataApi, l, i, j, row, col);
    }
  }

  // mirror L 180 degree move
  if (row > 1) {
    if (col > 0) {
      i = row - 2;
      j = col - 1;
      _applyingCondition(chessDataApi, l, i, j, row, col);
    }
  }
  // mirror L move

  if (row < 6) {
    if (col < 7) {
      i = row + 2;
      j = col - 1;
      _applyingCondition(chessDataApi, l, i, j, row, col);
    }
  }

// 45 degree rotated starts here

  // L 180 rotated move
  if (row > 0) {
    if (col < 6) {
      i = row - 1;
      j = col + 2;
      _applyingCondition(chessDataApi, l, i, j, row, col);
    }
  }

// L downward move
  if (row > 0) {
    if (col > 1) {
      i = row - 1;
      j = col - 2;
      _applyingCondition(chessDataApi, l, i, j, row, col);
    }
  }

  // mirror L 180 degree move
  if (row < 7) {
    if (col > 1) {
      i = row + 1;
      j = col - 2;
      _applyingCondition(chessDataApi, l, i, j, row, col);
    }
  }

//   // mirror L move

  if (row < 7) {
    if (col < 6) {
      i = row + 1;
      j = col + 2;
      _applyingCondition(chessDataApi, l, i, j, row, col);
    }
  }

  return l;
}

void _applyingCondition(List<List<Map<String, dynamic>>> chessDataApi,
    List<Map<String, int>> l, int i, int j, int row, int col) {
  if (chessDataApi[i][j]['eDetails']['isPlaced'] &&
      chessDataApi[i][j]['eDetails']['color'] !=
          chessDataApi[row][col]['eDetails']['color'] &&
      chessDataApi[i][j]['eDetails']['name'] != 'king') {
    l.add({
      'row': i,
      'col': j,
    });
  } else if (chessDataApi[i][j]['eDetails']['isPlaced'] == false) {
    l.add({
      'row': i,
      'col': j,
    });
  }
}
