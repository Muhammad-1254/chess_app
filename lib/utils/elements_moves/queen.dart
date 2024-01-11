import 'package:new_chess/utils/elements_moves/bishop.dart';
import 'package:new_chess/utils/elements_moves/rook.dart';

List<Map<String, int>> queen(List<List<Map<String, dynamic>>> chessDataApi,
    int row, int col, String color) {
  List<Map<String, int>> l = [];

  for (Map<String, int> item in bishop(chessDataApi, row, col, color)) {
    l.add(item);
  }

  for (Map<String, int> item in rook(chessDataApi, row, col, color)) {
    l.add(item);
  }

  return l;
}
