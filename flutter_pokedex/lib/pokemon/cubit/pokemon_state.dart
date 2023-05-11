part of 'pokemon_cubit.dart';

enum PokemonStatus {initial, loading, success, failure}

extension PokemonStatusX on PokemonStatus {
  bool get isInitial => this == PokemonStatus.initial;
  bool get isLoading => this == PokemonStatus.loading;
  bool get isSuccess => this == PokemonStatus.success;
  bool get isFailure => this == PokemonStatus.failure;
}

class PokemonState extends Equatable{
  const PokemonState({
    this.status = PokemonStatus.initial,
    Pokemon? pokemon
  }) : pokemon = pokemon ?? Pokemon.empty;

  final PokemonStatus status;
  final Pokemon pokemon;

  PokemonState copyWith({
    PokemonStatus? status,
    Pokemon? pokemon
  }) {
    return PokemonState(
        status: status ?? this.status,
        pokemon: pokemon ?? this.pokemon
    );
  }

  @override
  List<Object?> get props => [status, pokemon];
}