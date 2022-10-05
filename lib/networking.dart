import 'dart:convert';

import 'package:dota_2_heroes/matches.dart';
import 'package:dota_2_heroes/screens/first_screen.dart';
import 'package:http/http.dart' as http;

import 'heroes.dart';

class NetworkHelper {
  NetworkHelper(this.url, this.kek);

  final String url;
  final String kek;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      List<Heroes> heroesList = [];
      for (var item in decodedData) {
        Heroes heroes = Heroes(
            item['id'],
            item['localized_name'],
            item['5_pick'],
            item['5_win'],
            item['img'],
            item['5_win'] / item['5_pick'] * 100,
            item['primary_attr']);
        heroesList.add(heroes);
      }
      print('${heroesList.length} ses');
      heroesList.sort(((a, b) => b.winRate.compareTo(a.winRate)));
      heroesList.length = 10;
      return heroesList;
    } else {
      print(response.statusCode);
      return List.empty();
    }
  }

  Future getMatchesData() async {
    http.Response response = await http.get(Uri.parse(kek));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      List<Matches> matchesList = [];
      for (var item in decodedData) {
        Matches matches = Matches(
          item['match_id'],
          item['radiant_name'],
          item['dire_name'],
          item['league_name'],
          item['radiant_score'],
          item['dire_score'],
        );
        matchesList.add(matches);
      }
      matchesList.sort(((a, b) => b.matchID.compareTo(a.matchID)));
      matchesList.length = 50;
      return matchesList;
    }
  }
}
