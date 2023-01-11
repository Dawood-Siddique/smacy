// ignore_for_file: prefer_const_constructors, camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MaterialApp(
    home: tempCast(),
  ));
}

class tempCast extends StatefulWidget {
  const tempCast({super.key});

  @override
  State<tempCast> createState() => _tempCastState();
}

class _tempCastState extends State<tempCast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}

class cast extends StatefulWidget {
  const cast({super.key});

  @override
  State<cast> createState() => _castState();
}

class _castState extends State<cast> {
  final baseURL = "http://10.0.2.2:8000/cast/";
  @override
  void initState() {
    //1
    super.initState();
  }

  Future<void> loadCast() async {
    //2
  }
  Future<void> apiCall() async {
    final baseUri = Uri.parse(baseURL);
    final response = await http.get(baseUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
