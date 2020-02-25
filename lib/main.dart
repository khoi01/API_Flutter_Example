import 'package:api_example/api/jsong_parsing_map.dart';
import 'package:flutter/material.dart';

import 'api/json_parsing.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: JsonParsingMap()//Jsonarsing()
    );
  }
}