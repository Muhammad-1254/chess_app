List<Map<String, int>> rook(List<List<Map<String, dynamic>>> chessDataApi,
    int row, int col, String color) {
  List<Map<String, int>> l = [];

  for (int i = row + 1; i < 8; i++) {
    //checking if any element is present

    if (chessDataApi[i][col]['eDetails']['color'] !=
            chessDataApi[row][col]['eDetails']['color'] &&
        chessDataApi[i][col]['eDetails']['isPlaced'] &&
        chessDataApi[i][col]['eDetails']['name'] != 'king') {
      l.add({'row': i, 'col': col});
      break;
    } else if (chessDataApi[i][col]['eDetails']['color'] ==
        chessDataApi[row][col]['eDetails']['color']) {
      break;
    } else {
      l.add({'row': i, 'col': col});
    }
  }

  for (int i = row - 1; i >= 0; i--) {
    //checking if any element is present

    if (chessDataApi[i][col]['eDetails']['color'] !=
            chessDataApi[row][col]['eDetails']['color'] &&
        chessDataApi[i][col]['eDetails']['isPlaced'] &&
        chessDataApi[i][col]['eDetails']['name'] != 'king') {
      l.add({'row': i, 'col': col});
      break;
    } else if (chessDataApi[i][col]['eDetails']['color'] ==
        chessDataApi[row][col]['eDetails']['color']) {
      break;
    } else {
      l.add({'row': i, 'col': col});
    }
  }

  for (int j = col + 1; j < 8; j++) {
    //checking if any element is present

    if (chessDataApi[row][j]['eDetails']['color'] !=
            chessDataApi[row][col]['eDetails']['color'] &&
        chessDataApi[row][j]['eDetails']['isPlaced'] &&
        chessDataApi[row][j]['eDetails']['name'] != 'king') {
      l.add({'row': row, 'col': j});
      break;
    } else if (chessDataApi[row][j]['eDetails']['color'] ==
        chessDataApi[row][col]['eDetails']['color']) {
      break;
    } else {
      l.add({'row': row, 'col': j});
    }
  }

  for (int j = col - 1; j >= 0; j--) {
    //checking if any element is present

    if (chessDataApi[row][j]['eDetails']['color'] !=
            chessDataApi[row][col]['eDetails']['color'] &&
        chessDataApi[row][j]['eDetails']['isPlaced'] &&
        chessDataApi[row][j]['eDetails']['name'] != 'king') {
      l.add({'row': row, 'col': j});
      break;
    } else if (chessDataApi[row][j]['eDetails']['color'] ==
        chessDataApi[row][col]['eDetails']['color']) {
      break;
    } else {
      l.add({'row': row, 'col': j});
    }
  }
  return l;
}
