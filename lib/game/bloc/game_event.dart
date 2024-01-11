import 'package:flutter/material.dart' show immutable;

@immutable
sealed class GameEvent {}

final class GameInitialStartPlayEvent extends GameEvent {}

final class GameStartPlayEvent extends GameEvent {
  final List<List<Map<String, dynamic>>> chessDataApi;

  GameStartPlayEvent({required this.chessDataApi});
}

final class GameOnClickedElementEvent extends GameEvent {
  final Map<String, dynamic> element;

  GameOnClickedElementEvent({required this.element});
}

final class GameMoveElementEvent extends GameEvent {}

final class GameCheckHistoryOfGameEvent extends GameEvent {
  final bool isForward;
  GameCheckHistoryOfGameEvent({required this.isForward});
}
