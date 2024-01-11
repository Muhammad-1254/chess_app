import 'package:flutter/material.dart' show immutable;

@immutable
sealed class GameState {}

final class GameInitialState extends GameState {}

final class GameStartPlayState extends GameState {
  final List<List<Map<String, dynamic>>> chessDataApi;
  final Map<String, List> elements;

  GameStartPlayState({required this.chessDataApi, required this.elements});
}

final class GameOnClickedElementState extends GameState {
  final List<List<Map<String, dynamic>>> chessDataApi;

  GameOnClickedElementState({required this.chessDataApi});
}

final class GameMoveElementState extends GameState {
  final List<List<Map<String, dynamic>>> chessDataApi;

  GameMoveElementState({required this.chessDataApi});
}
