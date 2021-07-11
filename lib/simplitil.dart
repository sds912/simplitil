import 'package:flutter/material.dart';
import 'package:simplitil/ui/screens/home/index.dart';

class SimpliTil extends StatefulWidget {
  const SimpliTil({Key? key}) : super(key: key);

  @override
  _SimpliTilState createState() => _SimpliTilState();
}

class _SimpliTilState extends State<SimpliTil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
