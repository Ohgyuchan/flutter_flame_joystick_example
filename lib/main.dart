import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocks/score/score_bloc.dart';
import 'flame_layer/flame_layer.dart';
import 'flutter_layer/flutter_layer.dart';
import 'flutter_layer/main_drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscape();
  Flame.device.fullScreen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );

    return MaterialApp(
        theme: ThemeData(
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.orange, fontSize: 24),
            ),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.blueGrey,
                    textStyle: const TextStyle(fontSize: 24)))),
        home: BlocProvider<ScoreBloc>(
          create: (context) => ScoreBloc(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.orange,
            ),
            drawer: const MainDrawer(),
            body: Stack(
              children: const [
                FlameLayer(),
                FlutterLayer(),
              ],
            ),
          ),
        ));
  }
}
