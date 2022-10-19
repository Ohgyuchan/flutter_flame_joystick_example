import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flame_joystick_example/flame_layer/flame_layer.dart';
import 'package:flutter_flame_joystick_example/flutter_layer/flutter_layer.dart';

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
            bodyText2: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        home: Scaffold(
          body: Stack(
            children: const [
              FlameLayer(),
              FlutterLayer(),
            ],
          ),
        ));
  }
}
