import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/level/level_cubit.dart';
import '../blocks/score/score_bloc.dart';
import 'pinkie_game.dart';

class FlameLayer extends StatelessWidget {
  const FlameLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: PinkieGame(
        scoreBloc: context.read<ScoreBloc>(),
        levelCubit: context.read<LevelCubit>(),
      ),
    );
  }
}
