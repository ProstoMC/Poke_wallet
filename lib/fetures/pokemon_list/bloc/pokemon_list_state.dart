part of 'pokemon_list_bloc.dart';

class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListLoaded extends PokemonListState {
  PokemonListLoaded({required this.pokemonList});
  final List<Pokemon> pokemonList;
}
