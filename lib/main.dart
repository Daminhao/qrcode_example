import 'package:flutter/material.dart';
import 'pages/pages.dart';
//import 'pages/qrcode_page.dart';
import 'pages/testroute.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRCode Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.redAccent,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      //home: const FirstRoute(),
      home: const QRCodePage(),
      //home: const BodyLayout(),
      //home: const FirstScreen(),
    );
  }
}
