import 'package:breaking_bad/logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakingBad extends StatelessWidget {
  const BreakingBad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CharactersCubit()..getCharacters(),
        child: const CharactersScreen(),
      ),
    );
  }
}

void main() {
  runApp(const BreakingBad());
}
