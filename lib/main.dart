import 'package:flutter/material.dart';
import 'package:stuventmobil/ui/QrCode/generate.dart';
import 'package:stuventmobil/ui/QrCode/qr_code_page.dart';
import 'package:stuventmobil/ui/QrCode/scan.dart';
import 'ui/homepage/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/qrcodepage": (context) => QrCodePage(),
        "/scan" : (context) => ScanScreen(),
        "/generatescreen" : (context) => GenerateScreen(),
      },
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFF4700),
      ),
    );
  }
}
