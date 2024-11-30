import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/screens/character_details_screen.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final CharactersModel character;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CharacterDetailScreen(character: character);
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5, // used to give a shadow effect
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Character Image
            ClipRRect(
              // used to give a rounded corner effect
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.network(
                character.image,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress == null) return child;
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // },
                // errorBuilder: (context, error, stackTrace) =>
                //     const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 8),
            // Character Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                character.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Character Details (status, species, etc.)
          ],
        ),
      ),
    );
  }
}
