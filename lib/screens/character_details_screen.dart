import 'package:breaking_bad/constants.dart';
import 'package:flutter/material.dart';
import 'package:breaking_bad/data/models/characters.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharactersModel character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kYellow,
        title: Text(
          character.name,
          style: const TextStyle(
            color: kGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView for scrollable content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(character.image),
              const SizedBox(height: 10),
              Text(
                'Name: ${character.name}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text('Status: ${character.status}'),
              Text('Species: ${character.species}'),
              Text('Gender: ${character.gender}'),
              Text('Origin: ${character.originName}'),
              Text('Location: ${character.locationName}'),
              const SizedBox(height: 20),
              const Text('Episodes:'),
              // Use ListView.builder to show episodes if it's long
              ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling in ListView to prevent conflict with parent scroll
                itemCount: character.episodes.length,
                itemBuilder: (context, index) {
                  return Text(character.episodes[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
