
import 'package:flutter/material.dart';
import 'package:smacy/main.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

import 'package:smacy/movie.dart';

class json extends StatefulWidget {
  @override
  json_ createState() => json_();
}

class json_ extends State<json> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJson(),
        builder: (context, data){
          if (data.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else  if (data.hasData) {
            var items = data.data as List<movie>;
            
            return ListView.builder(
                itemCount: items.length,
                itemBuilder:(context, index) {
                  
                  return Container(
                    height: 400,
                    width:400,
                    child: Image(
                      image: NetworkImage(items[index].image.toString()),
                      fit: BoxFit.cover,
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future<List<movie>> ReadJson() async {
  final data = await rootBundle.rootBundle.loadString('assets/movie.json');
  final list = jsonDecode(data) as List<dynamic>;

  return list.map((e) => movie.fromJson(e)).toList();
}