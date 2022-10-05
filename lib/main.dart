import 'package:dota_2_heroes/screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CleanAPP());
}

class CleanAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        platform: TargetPlatform.iOS,
        // primaryColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.light().copyWith(primary: Color(0xFF32B67A)),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      initialRoute: FirstScreen.id,
      routes: {
        FirstScreen.id: (context) => FirstScreen(),
      },
    );
  }
}
