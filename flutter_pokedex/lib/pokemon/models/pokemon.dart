import 'package:equatable/equatable.dart';
import 'package:pokemon_repository/pokemon_repository.dart'
as pokemon_repository;

class Pokemon extends Equatable{
  const Pokemon({
    required this.id,
    required this.name,
    required this.image,
    this.isFavourite = false
  });

  static const empty = Pokemon(
      id: 0,
      name: '',
      image: '',
      isFavourite: false
  );

  final int? id;
  final String? name;
  final String? image;
  final bool isFavourite;

  factory Pokemon.fromRepository(pokemon_repository.Pokemon pokemon){
    return Pokemon(
        id: pokemon.id,
        name: pokemon.name,
        image: pokemon.image,
        isFavourite: pokemon.isFavourite
    );
  }

  @override
  List<Object?> get props => [id, name, image, isFavourite];

  Pokemon copyWith({
    int? id,
    String? name,
    String? image,
    bool isFavourite = false
  }) {
    return Pokemon(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        isFavourite: isFavourite ?? this.isFavourite
    );
  }
}