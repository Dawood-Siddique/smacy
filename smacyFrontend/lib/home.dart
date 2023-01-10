import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final int userId;
  const Home({super.key, required this.userId});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.userId.toString(),style: const TextStyle(color: Colors.white, fontSize: 24),)),
    );
  }
}
