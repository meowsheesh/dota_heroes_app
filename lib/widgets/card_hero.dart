import 'dart:ui';

import 'package:flutter/material.dart';

class CardHero extends StatelessWidget {
  CardHero(
      {Key? key,
      required this.imgString,
      required this.winRate,
      required this.heroName,
      required this.attr})
      : super(key: key);

  final String imgString;
  final double winRate;
  final String heroName;
  final String attr;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Color(0xff1E1E1E),
        ),
        width: 180,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: NetworkImage('https://api.opendota.com' + imgString),
                  width: 180,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                heroName,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'TrajanReg',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Winrate ',
                          style: TextStyle(fontSize: 16, color: Colors.green)),
                      TextSpan(
                          text: winRate.toStringAsFixed(1) + '%',
                          style: TextStyle(fontSize: 16, color: Colors.green)),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    'images/$attr.png',
                    width: 25,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Image(
//                     image: NetworkImage('https://api.opendota.com' + imgString),
//                     width: 90,
//                   ),

// Text('Winrate ' + winRate.toStringAsFixed(1) + '%'),