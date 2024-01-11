import 'package:new_chess/data/chess_data_api.dart';
import 'package:new_chess/utils/elements_moves/bishop.dart';
import 'package:new_chess/utils/elements_moves/king.dart';
import 'package:new_chess/utils/elements_moves/knight.dart';
import 'package:new_chess/utils/elements_moves/pawn.dart';
import 'package:new_chess/utils/elements_moves/queen.dart';
import 'package:new_chess/utils/elements_moves/rook.dart';

List<Map<String, int>> checkAvailablePlaces(Map<String, dynamic> element) {
  List<Map<String, int>> l = [];
  String name = element['eDetails']['name'];
  String color = element['eDetails']['color'];
  int row = element['eDetails']['position'][0];
  int col = element['eDetails']['position'][1];

  if (name == 'pawn') {
    l = pawn(chessDataApi, row, col, color);
  }
  if (name == 'rook') {
    l = rook(chessDataApi, row, col, color);
  }
  if (name == 'bishop') {
    l = bishop(chessDataApi, row, col, color);
  }
  if (name == 'knight') {
    l = knight(chessDataApi, row, col, color);
  }

  if (name == 'queen') {
    l = queen(chessDataApi, row, col, color);
  }

  if (name == 'king') {
    l = king(chessDataApi, row, col, color);
  }

  // print("list having places :${l}");
  return l;
}
