import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/movie.dart';

class MovieCell extends StatelessWidget {
  MovieCell({required this.movie, required this.searchWord, super.key});
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500/';
  final Movie movie;
  final String? searchWord;


  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl + movie.poster_path,
              height: 150,
              filterQuality: FilterQuality.none,
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width - 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: title()),
                  const Padding(padding: EdgeInsets.all(2.0)),
                  Text(
                    movie.overview,
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

  TextSpan title() {
    List<InlineSpan> inlineSpan = [];
    if (searchWord == null) {
      inlineSpan.add(TextSpan(text: movie.title, style: normalTextStyle));
    }

    if (searchWord != null) {
      inlineSpan.add(TextSpan(
          text: movie.title.split(searchWord!).first, style: normalTextStyle));
      inlineSpan.add(TextSpan(text: searchWord, style: searchTextStyle));
      inlineSpan.add(
        TextSpan(
          text:
              movie.title.split(searchWord!).last.substring(searchWord!.length),
          style: normalTextStyle,
        ),
      );
    }

    return TextSpan(children: inlineSpan);
  }

  static const TextStyle searchTextStyle = TextStyle(
    color: Colors.black,
    backgroundColor: Colors.yellow,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle normalTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
  );
}
