import 'package:flutter/material.dart';
//import 'pages/qrcode_page.dart';
import 'pages/qrcodepage.dart';

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
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(90, 86, 76, 109),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 65, 48, 95),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 34, 100, 145),
            backgroundColor: const Color.fromARGB(255, 189, 193, 233),
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
