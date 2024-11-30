import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/services/character_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import '../../data/services/character_api_service.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());

  getCharacters() async {
    try {
      List<CharactersModel> characters =
          await CharacterApiService(dio: Dio()).getAllCharacters();

      emit(CharactersLoaded(characters: characters));
    } catch (e) {
      emit(CharactersError(errorMessage: e.toString()));
    }
  }
}
