import 'package:flutter/material.dart';
import 'ui/homepage/home_page.dart';
import 'ui/homepage/uye_kayit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool byrk = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFF4700),
      ),
      home: byrk ? UyeKayit(): HomePage(),
    );
  }
}
