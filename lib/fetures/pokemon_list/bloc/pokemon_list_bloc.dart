import 'package:first_app/models/pokemon_model.dart';
import 'package:first_app/repositories/pokemon_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final AbstractPokemonListRepository pokemonListRepository;

  PokemonListBloc(this.pokemonListRepository) : super(PokemonListInitial()) {
    on<LoadPokemons>((event, emit) async {
      final pokemonList = await pokemonListRepository.fetchPokemonList();
      emit(PokemonListLoaded(pokemonList: pokemonList));
    });
    on<AddPokemon>((event, emit) async {
      final pokemonList = await pokemonListRepository.addPokemon();
      emit(PokemonListLoaded(pokemonList: pokemonList));
    });
  }
}
