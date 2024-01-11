import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_chess/data/chess_data_api.dart';
import 'package:new_chess/game/bloc/game_bloc.dart';
import 'package:new_chess/game/bloc/game_event.dart';
import 'package:new_chess/game/bloc/game_state.dart';
import 'package:new_chess/utils/utils.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    context.read<GameBloc>().add(GameInitialStartPlayEvent());
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    // print("device width: $deviceWidth");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chess Game"),
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          List whiteUserList = [];
          List blackUserList = [];
          if (state is GameStartPlayState) {
            whiteUserList = state.elements['white'] as List;
            blackUserList = state.elements['black'] as List;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("user :1"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: whiteUserList.map((item) {
                  return getChessIcon(
                      item['eDetails']['name'], item['eDetails']['color']);
                }).toList()),
              ),
              SizedBox(
                width: deviceWidth,
                height: deviceWidth,
                child: Stack(children: [
                  // board image
                  SizedBox(
                    width: deviceWidth,
                    height: deviceWidth,
                    child: Image.asset('assets/1.jpg'),
                  ),

                  if (state is GameInitialState)
                    Center(
                      child: Container(
                        width: deviceWidth / 1.5,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade500,
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context
                                .read<GameBloc>()
                                .add(GameInitialStartPlayEvent());
                          },
                          child: const Text(
                            "Play!",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  if (state is GameStartPlayState)
                    Container(
                      margin: EdgeInsets.all(deviceWidth / 20),
                      width: deviceWidth - (deviceWidth / 10),
                      height: deviceWidth - (deviceWidth / 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: generateBoardWidgets(
                            context, chessDataApi, deviceWidth),
                      ),
                    ),
                ]),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: blackUserList.map((item) {
                  return getChessIcon(
                      item['eDetails']['name'], item['eDetails']['color']);
                }).toList()),
              ),
              const Text("user :2"),
            ],
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // context.read<GameBloc>().add(
              //       GameCheckHistoryOfGameEvent(isForward: false),
              //     );
            },
            child: const Icon(Icons.navigate_before),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              // context.read<GameBloc>().add(
              //       GameCheckHistoryOfGameEvent(isForward: true),
              //     );
            },
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
