import 'package:breaking_bad/constants.dart';
import 'package:breaking_bad/logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/widgets/custom_character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kYellow,
        title: const Row(
          children: [
            Text(
              "Rick & Morty Characters",
              style: TextStyle(color: kGrey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: buildBlocWidget(),
    );
  }

  BlocBuilder<CharactersCubit, CharactersState> buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CharactersLoaded) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10, // Horizontal spacing between grids
              mainAxisSpacing: 10, // Vertical spacing between grids
              childAspectRatio: 0.7, // Aspect ratio for each grid item
            ),
            itemCount: state.characters.length,
            itemBuilder: (context, index) {
              // استخرج الشخصية الحالية
              final character = state.characters[index];
              // استخدم بيانات الشخصية
              return CharacterItem(character: character);
            },
          );
        } else if (state is CharactersError) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          return const Center(child: Text("Unknown state"));
        }
      },
    );
  }
}
