import 'package:equatable/equatable.dart';

class Pokemon extends Equatable{
  const Pokemon({
    required this.id,
    required this.name,
    required this.image,
    this.isFavourite = false
  });

  final int? id;
  final String? name;
  final String? image;
  final bool isFavourite;

  @override
  List<Object?> get props => [id, name, image, isFavourite];

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'id': id,
      'name': name,
      'image': image
    };
    return map;
  }

  static Pokemon fromMap(Map<String, Object?> map) {
    return Pokemon(
        id: map['id'] as int,
        name: map['name'] as String,
        image:  map['image'] as String
    );
  }
}