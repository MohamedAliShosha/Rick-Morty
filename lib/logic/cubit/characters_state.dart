part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  // In this case the state is loaded with a list of characters
  // so I declared it as a property of the class
  final List<CharactersModel> characters;

  CharactersLoaded({required this.characters});
}

class CharactersError extends CharactersState {
  final String errorMessage;

  CharactersError({required this.errorMessage});
}
