import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Jsonarsing extends StatefulWidget {
  Jsonarsing({Key key}) : super(key: key);

  @override
  _JsonarsingState createState() => _JsonarsingState();
}

class _JsonarsingState extends State<Jsonarsing> {
  Future data;

@override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Parsing JSON")
      ),
      body: Center(
        child:Container(
          child:FutureBuilder(
            future: getData(),
            builder: (context,AsyncSnapshot<dynamic> snapshot){
              if(snapshot.hasData){
                return createListView(snapshot.data,context);
                //return Text(snapshot.data[0]['userId'].toString()+"-"+snapshot.data[0]['title']);
              }else{
                CircularProgressIndicator();
              }
            
            }),
        ),
      ),
    );
  }


    Widget createListView(List data, BuildContext context) {
      return Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,int index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(height:5.0),
              ListTile(
                title:Text("${data[index]["title"]}"),
                subtitle: Text("${data[index]["body"]}"),
                leading: Column(
                  children:<Widget>[
                    CircleAvatar(
                      backgroundColor:Colors.black26,
                      radius:23,
                      child:Text("${data[index]["id"]}")
                    )
                  ]
                ),
              )
            ],
          );
        }),
      );
    }

  Future getData() async{
    var data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network netowrk = Network(url);
    data = netowrk.fetchData();

    // data.then((value){
    //   print(value);
    //   print("====");
    //   print(value[0]["title"]); //access 1st object and display title
    // });

    return data;
  }
}



//fetch data from server
class Network{
  final String url;

  Network(this.url);

Future fetchData() async{
  print("$url");
  Response response = await get(Uri.encodeFull(url));

  if(response.statusCode == 200){
    //ok
    return json.decode(response.body);
  }else{
    print("Fetch failed:"+response.statusCode.toString());
  }
}

}