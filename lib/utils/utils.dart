// ignore: library_prefixes
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart' as ChessIcon;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_chess/game/bloc/game_bloc.dart';
import 'package:new_chess/game/bloc/game_event.dart';
import 'package:new_chess/global_data.dart';

List<Widget> generateBoardWidgets(BuildContext context,
    List<List<Map<String, dynamic>>> chessDataApi, double deviceWidth) {
  List<Widget> columnData = [];
  Color color = Colors.transparent;
  for (List<Map<String, dynamic>> itemI in chessDataApi) {
    List<Widget> tempData = [];

    for (Map<String, dynamic> itemJ in itemI) {
      for (List place in availablePlaces) {
        if (place[0] == itemJ['eDetails']['position'][0] &&
            place[1] == itemJ['eDetails']['position'][1]) {
          color = Colors.amber;
          break;
        } else {
          color = Colors.transparent;
        }
      }
      tempData.add(
        GestureDetector(
          onTap: () {
            print('ontap starts');
            _onTap(context, itemJ);
            print('ontap end');
          },
          child: Container(
              width: deviceWidth / 10,
              height: deviceWidth / 10,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(555),
              ),
              child: getChessIcon(
                  itemJ['eDetails']['name'], itemJ['eDetails']['color'])),
        ),
      );
    }
    columnData.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tempData,
      ),
    );
  }
  return columnData;
}

Widget getChessIcon(String iconName, color) {
  // print("iconName :$iconName");
  // print("iconColor :$color");

  if (iconName == 'king' && color == 'white') {
    return ChessIcon.WhiteKing();
  } else if (iconName == 'queen' && color == 'white') {
    return ChessIcon.WhiteQueen();
  } else if (iconName == 'rook' && color == 'white') {
    return ChessIcon.WhiteRook();
  } else if (iconName == 'bishop' && color == 'white') {
    return ChessIcon.WhiteBishop();
  } else if (iconName == 'knight' && color == 'white') {
    return ChessIcon.WhiteKnight();
  } else if (iconName == 'pawn' && color == 'white') {
    return ChessIcon.WhitePawn();
  }

  //black starts here
  else if (iconName == 'king' && color == 'black') {
    return ChessIcon.BlackKing();
  } else if (iconName == 'queen' && color == 'black') {
    return ChessIcon.BlackQueen();
  }

  if (iconName == 'rook' && color == 'black') {
    return ChessIcon.BlackRook();
  } else if (iconName == 'bishop' && color == 'black') {
    return ChessIcon.BlackBishop();
  } else if (iconName == 'knight' && color == 'black') {
    return ChessIcon.BlackKnight();
  } else if (iconName == 'pawn' && color == 'black') {
    return ChessIcon.BlackPawn();
  } else {
    return const Text('');
  }
}

void _onTap(
  BuildContext context,
  itemJ,
) {
  // print("cond 0");
  // print(" cond 0: stackForIsClicked: ${stackForIsClicked}");
  if (stackForIsClicked.isEmpty) {
    context.read<GameBloc>().add(GameOnClickedElementEvent(element: itemJ));
    stackForIsClicked.add(itemJ);
    print("utils: stackForIsClicked.isEmpty: $itemJ");
    // print("cond 1");
  } else if (availablePlaces.any(
    (element) => const ListEquality().equals(element,
        [itemJ['eDetails']['position'][0], itemJ['eDetails']['position'][1]]),
  )) {
    stackForIsClicked.add(itemJ);
    context.read<GameBloc>().add(GameMoveElementEvent());
    print("utils: availablePlaces.any: $stackForIsClicked");

    // print("cond 2");
  } else {
    stackForIsClicked = [];
    context.read<GameBloc>().add(GameOnClickedElementEvent(element: itemJ));
    stackForIsClicked.add(itemJ);
    // print("cond 3");
  }
}
