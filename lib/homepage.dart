import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_cell.dart';
import 'movie_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Movie>? movies;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: movies == null ? 0 : movies?.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MovieDetail(movie: movies![i]);
                    }),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: MovieCell(movie: movies![i]),
              ),
            );
          }),
    );
  }

  Future<void> getData() async {
    const apiKey = "4a82174a7121e37caf158f0807997446";
    const url = 'http://api.themoviedb.org/3/discover/movie?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        movies = List.from(data['results']).map((e) => Movie.fromJson(e)).toList();
      });
    }
  }
}
