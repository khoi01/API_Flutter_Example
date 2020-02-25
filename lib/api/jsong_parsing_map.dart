import 'dart:convert';

import 'package:api_example/model/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingMap extends StatefulWidget {
  JsonParsingMap({Key key}) : super(key: key);

  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {

Future<PostList> data;

@override
  void initState() {
    super.initState();
    Network network = Network("https://jsonplaceholder.typicode.com/posts");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    
    );
  }
}




//fetch data from server
class Network{
  final String url;

  Network(this.url);

// Future fetchData() async{
//   print("$url");
//   Response response = await get(Uri.encodeFull(url));

//   if(response.statusCode == 200){
//     //ok
//     return json.decode(response.body);
//   }else{
//     print("Fetch failed:"+response.statusCode.toString());
//   }
// }

Future<PostList> loadPosts() async{
  final response = await get(Uri.encodeFull(url));

  if(response.statusCode == 200){
    return PostList.fromJson(json.decode(response.body));
  }else{
    throw Exception("failed to get posts");
  }

}

}