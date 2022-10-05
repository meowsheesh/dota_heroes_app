import 'package:flutter/material.dart';

class HeroesList extends StatelessWidget {
  const HeroesList({
    Key? key,
    required this.heroNamed,
    required this.fivePickw,
    required this.fiveWinw,
  }) : super(key: key);

  final String heroNamed;
  final int fivePickw;
  final int fiveWinw;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            heroNamed,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(fivePickw.toString()),
          Text(fiveWinw.toString())
        ],
      ),
    );
  }
}
