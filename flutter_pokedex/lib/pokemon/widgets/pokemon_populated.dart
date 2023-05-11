import 'package:flutter/material.dart';

class PokemonPopulated extends StatelessWidget {
  const PokemonPopulated({Key? key,
    required this.id,
    required this.name,
    required this.image
  }) : super(key: key);

  final int id;
  final String name;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(image),
          const SizedBox(height: 20,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('#$id'),
              const SizedBox(width: 10,),
              Text(name)
            ],
          )
        ],
      ),
    );
  }
}
