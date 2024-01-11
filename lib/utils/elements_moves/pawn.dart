List<Map<String, int>> pawn(List<List<Map<String, dynamic>>> chessDataApi,
    int row, int col, String color) {
  List<Map<String, int>> l = [];

  //checking if other element is present on right side
  if (color == 'white') {
    if (col < 7 && row < 7) {
      if (chessDataApi[row + 1][col + 1]['eDetails']['isPlaced'] &&
          chessDataApi[row][col]['eDetails']['color'] !=
              chessDataApi[row + 1][col + 1]['eDetails']['color'] &&
          chessDataApi[row + 1][col + 1]['eDetails']['name'] != 'king') {
        // print("if (col < 7) inside");

        l.add({
          "row": row + 1,
          'col': col + 1,
        });
        print("l :$l");
      }
    }
    //checking if other element is present on left side

    if (col > 0 && row < 7) {
      // print("  else if (col > 0) {");
      if (chessDataApi[row + 1][col - 1]['eDetails']['isPlaced'] == true &&
          chessDataApi[row][col]['eDetails']['color'] !=
              chessDataApi[row + 1][col - 1]['eDetails']['color'] &&
          chessDataApi[row + 1][col - 1]['eDetails']['name'] != 'king') {
        // print("  else if (col > 0) {");

        l.add({
          "row": row + 1,
          'col': col - 1,
        });
      }
    }
// first move of pawn having two box
    if (row == 1) {
      if (chessDataApi[row + 2][col]['eDetails']['isPlaced'] == false) {
        l.add({'row': row + 2, 'col': col});
      }
    }

    // for moving forward direction

    if (row < 7) {
      if (chessDataApi[row + 1][col]['eDetails']['isPlaced'] == false) {
        l.add({
          "row": row + 1,
          'col': col,
        });
      }
    }
  }

  if (color == 'black') {
    //checking if other element is present on right side
    if (col < 7 && row > 0) {
      if (chessDataApi[row - 1][col + 1]['eDetails']['isPlaced'] &&
          chessDataApi[row][col]['eDetails']['color'] !=
              chessDataApi[row - 1][col + 1]['eDetails']['color'] &&
          chessDataApi[row - 1][col + 1]['eDetails']['name'] != 'king') {
        // print("if (col < 7) inside");

        l.add({
          "row": row - 1,
          'col': col + 1,
        });
        print("l :$l");
      }
    }
    //checking if other element is present on left side

    if (col > 0 && row > 0) {
      // print("  else if (col > 0) {");
      if (chessDataApi[row - 1][col - 1]['eDetails']['isPlaced'] == true &&
          chessDataApi[row][col]['eDetails']['color'] !=
              chessDataApi[row - 1][col - 1]['eDetails']['color'] &&
          chessDataApi[row - 1][col - 1]['eDetails']['name'] != 'king') {
        // print("  else if (col > 0) {");

        l.add({
          "row": row - 1,
          'col': col - 1,
        });
      }
    }
// first move of pawn having two box
    if (row == 6) {
      if (chessDataApi[row - 2][col]['eDetails']['isPlaced'] == false) {
        l.add({'row': row - 2, 'col': col});
      }
    }

    if (row > 0) {
      if (chessDataApi[row - 1][col]['eDetails']['isPlaced'] == false) {
        l.add({
          "row": row - 1,
          'col': col,
        });
      }
    }
  }
  return l;
}
