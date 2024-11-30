import 'package:breaking_bad/data/models/characters.dart';
import 'package:dio/dio.dart';

class CharacterApiService {
  final Dio dio;

  CharacterApiService({required this.dio});

  Future<List<CharactersModel>> getAllCharacters() async {
    try {
      final response =
          await dio.get('https://rickandmortyapi.com/api/character');
      if (response.statusCode == 200) {
        // Parse the list of characters from the 'results' key
        return List<CharactersModel>.from(
          response.data['results'].map(
            (json) => CharactersModel.fromJson(json),
          ),
        );
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Error fetching characters: $e');
    }
  }
}
