import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/score/score_bloc.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScoreBloc, ScoreState>(
      listener: (context, state) {
        if (state.score == 2) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text("Congratulations! You are rich!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Buy jet fuel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Save in treasure chest"),
                    ),
                  ],
                );
              });
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Score: ${state.score}"),
            TextButton(
              onPressed: () {
                context.read<ScoreBloc>().add(IncreaseScoreEvent());
              },
              child: const Text('+ score'),
            )
          ],
        );
      },
    );
  }
}
