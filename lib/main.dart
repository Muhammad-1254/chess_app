import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_chess/game/bloc/game_bloc.dart';
import 'package:new_chess/game/game_page.dart';
import 'package:new_chess/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'gamePage',
        routes: {
          'homePage': (context) => const MyHomePage(),
          'gamePage': (context) => const GamePage()
        },
      ),
    );
  }
}
