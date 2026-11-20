import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;

    if (cachedMovies != null) {
      return cachedMovies;
    }

    return const [
      Movie(
        id: 'bee-movie',
        title: 'Bee Movie',
        synopsis:
            'Barry B. Benson discovers that humans have been stealing and consuming honey.',
        ageRating: 'PG',
        runtime: '91 mins',
        screeningTime: '18:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/bee_movie.jpg',
      ),
      Movie(
        id: 'shrek',
        title: 'Shrek',
        synopsis:
            'An ogre sets out to rescue a princess and unexpectedly finds friendship along the way.',
        ageRating: 'U',
        runtime: '90 mins',
        screeningTime: '20:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/shrek.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final Movie movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }

    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);

    final dynamic decodedData = jsonDecode(jsonString);

    final List<dynamic> jsonList = decodedData as List<dynamic>;

    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;

      final Movie movie = Movie.fromJson(itemMap);

      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;

    return loadedMovies;
  }
}
