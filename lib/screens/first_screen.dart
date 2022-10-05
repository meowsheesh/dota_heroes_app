import 'dart:convert';

import 'package:dota_2_heroes/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/card_hero.dart';
import '../widgets/heroes_list.dart';
import '../widgets/matches_list.dart';

//https://mega.nz/folder/Ko4y3Awa#5uJvCVjR5gAFXGCAYEr82g
String heroName = 'sd';
int fivePick = 2;
int fiveWin = 2;

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static String id = 'first_screen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHeroesInfo();
  }

  Future getHeroesInfo() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.opendota.com/api/heroStats',
        'https://api.opendota.com/api/proMatches');
    var heroesInfoData = await networkHelper.getData();
    return heroesInfoData;
  }

  Future getMatchesInfo() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.opendota.com/api/heroStats',
        'https://api.opendota.com/api/proMatches');
    var matchesInfoData = await networkHelper.getMatchesData();
    return matchesInfoData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xff121212),
      body: SingleChildScrollView(
        child: Column(children: [
          Text(
            'HIGHEST WIN RATE, THIS MONTH',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Legend',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Change Ranks',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 200,
              child: FutureBuilder(
                future: getHeroesInfo(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Text('SHa'),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        double winRate = snapshot.data[index].winRate;
                        String imgString = snapshot.data[index].img.toString();
                        String heroName = snapshot.data[index].localizedName;
                        String attr = snapshot.data[index].attr;
                        return CardHero(
                            attr: attr,
                            imgString: imgString,
                            winRate: winRate,
                            heroName: heroName);
                      },
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'top currently ongoing live games'.toUpperCase(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 4000,
              child: FutureBuilder(
                future: getMatchesInfo(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Text('SHa'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        String leagueName = snapshot.data[index].leagueName;
                        String radiantName = snapshot.data[index].radiantName;
                        String direName = snapshot.data[index].direName;
                        int radiantScore = snapshot.data[index].radiantScore;
                        int direScore = snapshot.data[index].direScore;
                        return MatchesList(
                          leagueName: leagueName,
                          radiantName: radiantName,
                          direName: direName,
                          radiantScore: radiantScore,
                          direScore: direScore,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
