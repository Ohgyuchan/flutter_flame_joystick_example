import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flame_joystick_example/blocks/score/score_bloc.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              "assets/images/red_gem.png",
              width: 64,
              height: 64,
            ),
            title: const Text("Blood Ruby"),
            onTap: () {
              Navigator.pop(context);
              context
                  .read<ScoreBloc>()
                  .add(const ChangeGemScoreEvent(gemType: GemType.red));
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/pink_gem.png",
              width: 64,
              height: 64,
            ),
            title: const Text("Soul Crystal"),
            onTap: () {
              Navigator.pop(context);
              context
                  .read<ScoreBloc>()
                  .add(const ChangeGemScoreEvent(gemType: GemType.pink));
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/green_gem.png",
              width: 64,
              height: 64,
            ),
            title: const Text("Envy Lens"),
            onTap: () {
              Navigator.pop(context);
              context
                  .read<ScoreBloc>()
                  .add(const ChangeGemScoreEvent(gemType: GemType.green));
            },
          ),
        ],
      ),
    );
  }
}
