import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pokemon/models/pokemon.dart';
import 'package:favourite_pokemon_table/favourite_pokemon_table.dart';

class FavouritesList extends StatefulWidget {
  const FavouritesList({Key? key,}) : super(key: key);

  @override
  State<FavouritesList> createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> {

  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    databaseHelper.open();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    databaseHelper.close();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: databaseHelper.getFavourites(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data != null){
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ReorderableListView(
                  children: [
                    for(int index = 0; index < snapshot.data.length; index++)
                      ListTile(
                        key: Key(index.toString()),
/*
                        leading: Image.network(snapshot.data[index].image!),
*/
                        title: Text(snapshot.data[index].name!),
                      )
                  ],
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if(oldIndex < newIndex){
                        newIndex -= 1;
                      }
                      final Pokemon item = snapshot.data.removeAt(oldIndex);
                      snapshot.data.insert(newIndex, item);
                    });
                  }),
            );
          }
          else if(snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
