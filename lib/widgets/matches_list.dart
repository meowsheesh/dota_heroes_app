import 'package:flutter/material.dart';

class MatchesList extends StatelessWidget {
  const MatchesList({
    Key? key,
    required this.direName,
    required this.radiantName,
    required this.radiantScore,
    required this.direScore,
    required this.leagueName,
  }) : super(key: key);

  final String leagueName;
  final String radiantName;
  final String direName;
  final int radiantScore;
  final int direScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1E1E1E),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                leagueName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  radiantName,
                  style: TextStyle(fontSize: 20),
                ),
                // Text('VS', style: TextStyle(fontSize: 24)),
                Text(direName, style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(radiantScore.toString(), style: TextStyle(fontSize: 24)),
                Text('VS',
                    style: TextStyle(fontSize: 24, color: Colors.transparent)),
                Text(direScore.toString(), style: TextStyle(fontSize: 24)),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 182, 182, 182),
            )
          ],
        ),
      ),
    );
  }
}
