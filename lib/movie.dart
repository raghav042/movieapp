// class Movie {
//   Movie(
//     this.adult,
//     this.backdrop_path,
//     this.genre_ids,
//     this.id,
//     this.original_language,
//     this.original_title,
//     this.overview,
//     this.popularity,
//     this.poster_path,
//     this.release_date,
//     this.title,
//     this.video,
//     this.vote_average,
//     this.vote_count,
//   );
//
//   final String adult;
//   final String backdrop_path;
//   final List<int> genre_ids;
//   final int id;
//   final String original_language;
//   final String original_title;
//   final String overview;
//   final double popularity;
//
//   final String poster_path;
//   final String release_date;
//
//   final String title;
//   final bool video;
//   final double vote_average;
//   final int vote_count;
//
//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       json['adult'],
//       json['backdrop_path'],
//       json['genre_ids'],
//       json['id'],
//       json['original_language'],
//       json['original_title'],
//       json['overview'],
//       json['popularity'],
//       json['poster_path'],
//       json['release_date'],
//       json['title'],
//       json['video'],
//       json['vote_average'],
//       json['vote_count'],
//     );
//   }
// }
