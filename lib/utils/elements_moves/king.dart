List<Map<String, int>> king(List<List<Map<String, dynamic>>> chessDataApi,
    int row, int col, String color) {
  List<Map<String, int>> l = [];

  int i = 0;
  int j = 0;

  if (row < 7) {
    i = row + 1;
    j = col;
    _applyingCondition(chessDataApi, l, i, j, row, col);
  }

  if (row > 0) {
    i = row - 1;
    j = col;
    _applyingCondition(chessDataApi, l, i, j, row, col);
  }

  if (col < 7) {
    i = row;
    j = col + 1;
    _applyingCondition(chessDataApi, l, i, j, row, col);
  }

  if (col > 0) {
    i = row;
    j = col - 1;
    _applyingCondition(chessDataApi, l, i, j, row, col);
  }
  //diagonal wise

  if (row < 7 && col < 7) {
    i = row + 1;
    j = col + 1;
    _applyingCondition(chessDataApi, l, i, j, row, col);
  }

  if (row < 7 && col > 0) {
    i = row + 1;
    j = col - 1;
    _applyingCondition(chessDataApi, l, i, j, row, col);
  }
  if (row > 0 && col < 7) {
    i = row - 1;
    j = col + 1;
    _applyingCondition(chessDataApi, l, i, j, row, col);
  }
  if (row > 0 && col > 0) {
    i = row - 1;
    j = col - 1;
    _applyingCondition(chessDataApi, l, i, j, row, col);
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
