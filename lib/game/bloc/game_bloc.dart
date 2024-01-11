import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_chess/data/chess_data_api.dart';
import 'package:new_chess/game/bloc/game_event.dart';
import 'package:new_chess/game/bloc/game_state.dart';
import 'package:new_chess/global_data.dart';
import 'package:new_chess/utils/game_element_places.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitialState()) {
    on<GameInitialStartPlayEvent>(_gameInitialEvent);
    on<GameOnClickedElementEvent>(_gameOnClickedElementEvent);
    on<GameMoveElementEvent>(_gameMoveElementEvent);
    on<GameCheckHistoryOfGameEvent>(_gameCheckHistoryOfGameEvent);
  }

  void _gameInitialEvent(
      GameInitialStartPlayEvent event, Emitter<GameState> emit) {
    emit(GameStartPlayState(chessDataApi: chessDataApi, elements: {
      'white': whiteUser,
      'black': blackUser,
    }));
  }

  void _gameOnClickedElementEvent(
      GameOnClickedElementEvent event, Emitter<GameState> emit) {
    //
    int row = event.element['eDetails']['position'][0];
    int col = event.element['eDetails']['position'][1];

    if (event.element['eDetails']['isPlaced'] == false) {
      return;
    }

    List<Map<String, int>> places = checkAvailablePlaces(event.element);

    if (places.isEmpty) return;

    availablePlaces = [];
    for (Map<String, int> place in places) {
      availablePlaces.add([place['row'] as int, place['col'] as int]);
    }

    emit(
      GameStartPlayState(chessDataApi: chessDataApi, elements: {
        'white': whiteUser,
        'black': blackUser,
      }),
    );

    // checkRedPlaces(listDataModel).forEach((element) {
    //
    // });
  }
}

void _gameMoveElementEvent(
    GameMoveElementEvent event, Emitter<GameState> emit) {
  Map<String, dynamic> place = stackForIsClicked[1];
  Map<String, dynamic> mover = stackForIsClicked[0];
  int pRow = place['eDetails']['position'][0];
  int pCol = place['eDetails']['position'][1];

  int mRow = mover['eDetails']['position'][0];
  int mCol = mover['eDetails']['position'][1];

  if (place['eDetails']['isPlaced']) {
    if (place['eDetails']['color'] == 'white') {
      blackUser.add(place);
      //
      //
    } else if (place['eDetails']['color'] == 'black') {
      whiteUser.add(place);
      //
    }
  }

  // swapping two elements places
  chessDataApi[pRow][pCol] = {
    'availablePlace': [],
    'isClicked': false,
    'eDetails': {
      'name': mover['eDetails']['name'],
      'color': mover['eDetails']['color'],
      'isPlaced': mover['eDetails']['isPlaced'],
      'position': place['eDetails']['position']
    }
  };

  //
  chessDataApi[mRow][mCol] = {
    'availablePlace': [],
    'isClicked': false,
    'eDetails': {
      'name': 'empty',
      'color': 'null',
      'isPlaced': false,
      'position': [mRow, mCol]
    }
  };
  //

  emit(
    GameStartPlayState(chessDataApi: chessDataApi, elements: {
      'white': whiteUser,
      'black': blackUser,
    }),
  );
  //
  //

  stackForIsClicked = [];
  availablePlaces = [];
}

void _gameCheckHistoryOfGameEvent(
    GameCheckHistoryOfGameEvent event, Emitter<GameState> emit) {
  if (gameHistoryIndex == 0) {
    gameHistoryIndex = gameHistory.length - 1;
    if (gameHistoryIndex == 0 || gameHistoryIndex == -1) return;
  }
  if (event.isForward) {
    tempChessDataApi = chessDataApi;
    chessDataApi = gameHistory[gameHistoryIndex];
    // emit(GameStartPlayState(chessDataApi: chessDataApi));
    return;
  } else {}
}
