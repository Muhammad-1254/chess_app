import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    // print("device width: $deviceWidth");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chess Game",
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('gamePage', arguments: false);
            },
            child: const Text(
              "Play!",
            ),
          ),
        ],
      ),
    );
  }
}







//  body: BlocBuilder<HomeBloc, HomeState>(
//         builder: (context, state) {
//           if (state is HomeGameState) {
//             List<Widget> board = generateBoardWidgets(
//                 context, state, state.chessDataApi, deviceWidth);
//             return Column(
//               children: [
//                 const Text("user 1"),
//                 Stack(
//                   // alignment: Alignment.center,
//                   fit: StackFit.passthrough,
//                   alignment: Alignment.center,
//                   children: [
//                     SizedBox(
//                       width: deviceWidth,
//                       height: deviceWidth,
//                       child: Image.asset(
//                         'assets/1.jpg',
//                       ),
//                     ),
//                     Container(
//                       // color: Colors.redAccent,
//                       width: deviceWidth - (deviceWidth / 10),
//                       height: deviceWidth - (deviceWidth / 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: board,
//                       ),
//                     )
//                   ],
//                 ),
//                 const Text("user 2"),
//               ],
//             );
//           } else {
//             return const SizedBox();
//           }
//         },
//       ),