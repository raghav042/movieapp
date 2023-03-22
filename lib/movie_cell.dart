import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCell extends StatelessWidget {
  const MovieCell(this.movies, this.i, {super.key});
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500/';
  final List<dynamic> movies;
  final int i;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl + movies[i]['poster_path'],
              height: 150,
              filterQuality: FilterQuality.none,
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width - 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movies[i]['title'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2.0)),
                  Text(
                    movies[i]['overview'],
                    maxLines: 3,
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
