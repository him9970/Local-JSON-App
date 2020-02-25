import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "JSON APP",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
        home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("JSON APP"),
      ),

      body: new Container(
        child: new Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
            .loadString('load_json/person.json'),
            builder: (context,snapshot){

              // Decode JSON
              var mydata = json.decode(snapshot.data.toString());

              return new ListView.builder(
                  itemBuilder: (BuildContext context, int index){

                    return new Card(
                      child: new Padding(padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text("Name : "+mydata[index]['name'],
                              style: TextStyle(fontSize: 18, color: Colors.blue,),
                            ),

                            new Padding(padding: const EdgeInsets.only(top: 2)
                            ),

                            new Text("Age : "+mydata[index]['age'],
                              style: TextStyle(fontSize: 18, color: Colors.blue,),
                            ),

                            new Padding(padding: const EdgeInsets.only(top: 2)
                            ),

                            new Text("Height : "+mydata[index]['height'],
                              style: TextStyle(fontSize: 18, color: Colors.blue,),
                            ),

                            new Padding(padding: const EdgeInsets.only(top: 2)
                            ),

                            new Text("Gender : "+mydata[index]['gender'],
                              style: TextStyle(fontSize: 18, color: Colors.blue,),
                            ),

                            new Padding(padding: const EdgeInsets.only(top: 2)
                            ),

                            new Text("Hair Color : "+mydata[index]['hair_color'],
                              style: TextStyle(fontSize: 18, color: Colors.blue,),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

