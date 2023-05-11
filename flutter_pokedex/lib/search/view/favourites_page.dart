import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pokemon/widgets/favourites_list.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage._();

  static Route<String> route(){
    return MaterialPageRoute(builder: (_) => const FavouritesPage._());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Favourites'),),
        body: const Center(
          child: SingleChildScrollView(
            child: FavouritesList(),
            ),
          ),
        );
  }
}

