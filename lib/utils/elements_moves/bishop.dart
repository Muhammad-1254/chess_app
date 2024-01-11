List<Map<String, int>> bishop(List<List<Map<String, dynamic>>> chessDataApi,
    int row, int col, String color) {
  List<Map<String, int>> l = [];

  // +ve diagonal side 175 degree
  int j = col;
  for (int i = row + 1; i < 8; i++) {
    if (j < 7) j += 1;
    if (chessDataApi[i][j]['eDetails']['color'] !=
            chessDataApi[row][col]['eDetails']['color'] &&
        chessDataApi[i][j]['eDetails']['isPlaced'] &&
        chessDataApi[i][j]['eDetails']['name'] != 'king') {
      l.add({'row': i, 'col': j});
      break;
    } else if (chessDataApi[i][j]['eDetails']['color'] ==
        chessDataApi[row][col]['eDetails']['color']) {
      break;
    } else {
      l.add({'row': i, 'col': j});
    }
  }

  // -ve diagonal side 175 degree
  j = col;
  for (int i = row - 1; i > 0; i--) {
    if (j == 0) break;
    if (j > 0) j -= 1;
    if (chessDataApi[i][j]['eDetails']['color'] !=
            chessDataApi[row][col]['eDetails']['color'] &&
        chessDataApi[i][j]['eDetails']['isPlaced'] &&
        chessDataApi[i][j]['eDetails']['name'] != 'king') {
      l.add({'row': i, 'col': j});
      break;
    } else if (chessDataApi[i][j]['eDetails']['color'] ==
        chessDataApi[row][col]['eDetails']['color']) {
      break;
    } else {
      l.add({'row': i, 'col': j});
    }
  }

  // +ve diagonal side 45 degree
  j = col;
  for (int i = row + 1; i < 8; i++) {
    if (j == 0) break;
    if (j > 0) j -= 1;
    if (chessDataApi[i][j]['eDetails']['color'] !=
            chessDataApi[row][col]['eDetails']['color'] &&
        chessDataApi[i][j]['eDetails']['isPlaced'] &&
        chessDataApi[i][j]['eDetails']['name'] != 'king') {
      l.add({'row': i, 'col': j});
      break;
    } else if (chessDataApi[i][j]['eDetails']['color'] ==
        chessDataApi[row][col]['eDetails']['color']) {
      break;
    } else {
      l.add({'row': i, 'col': j});
    }
  }

  // +ve diagonal side 45 degree
  j = col;
  for (int i = row - 1; i > 0; i--) {
    if (j == 7) break;
    if (j < 8) j += 1;
    if (chessDataApi[i][j]['eDetails']['color'] !=
            chessDataApi[row][col]['eDetails']['color'] &&
        chessDataApi[i][j]['eDetails']['isPlaced'] &&
        chessDataApi[i][j]['eDetails']['name'] != 'king') {
      l.add({'row': i, 'col': j});
      break;
    } else if (chessDataApi[i][j]['eDetails']['color'] ==
        chessDataApi[row][col]['eDetails']['color']) {
      break;
    } else {
      l.add({'row': i, 'col': j});
    }
  }
  return l;
}
