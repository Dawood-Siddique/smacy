import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../downloadPage.dart';

class Poster extends StatefulWidget {
  final String poster;
  const Poster({super.key, required this.poster});

  @override
  State<Poster> createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 115,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        imageUrl: widget.poster,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
