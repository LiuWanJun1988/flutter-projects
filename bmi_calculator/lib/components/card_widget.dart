import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {

  CardWidget({@required this.colour, this.cardChild, this.tapReaction});
  final Color colour;
  final Widget cardChild;
  final VoidCallback tapReaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapReaction,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: cardChild,
      ),
    );
  }
}

