import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:sqflite/sqflite.dart';

final String tablePokemon = 'favourite';
final String columnId = 'id';
final String columnName = 'name';
final String columnImage = 'image';

class DatabaseHelper{
  late Database db;

  Future open() async {
    String path = '$tablePokemon.db';

    db = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
      await db.execute('''
      create table $tablePokemon (
      $columnId integer primary key,
      $columnName text not null,
      $columnImage text not null
      )
      ''');
    });
  }

  Future<void> insert(Pokemon pokemon) async {
    await db.insert(tablePokemon, pokemon.toMap());
  }

  Future<List<Pokemon>> getFavourites() async {
    await open();
    List<Map<String, Object?>> maps = await db.query(tablePokemon);

    List<Pokemon> favourites = List<Pokemon>.generate(maps.length, (index) => Pokemon.fromMap(maps[index]));

    return favourites;
  }

  Future<void> delete(Pokemon pokemon) async {
    await db.delete(tablePokemon, where: '$columnId = ?', whereArgs: [pokemon.id]);
  }

  Future close() async => db.close();
}