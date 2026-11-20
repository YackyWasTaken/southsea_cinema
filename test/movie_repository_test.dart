import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MovieRepository tests', () {
    test('getMovies returns two movies before JSON is loaded', () {
      final MovieRepository repository = MovieRepository();

      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
      expect(movies[0].id, 'bee-movie');
      expect(movies[0].title, 'Bee Movie');
      expect(movies[1].id, 'shrek');
      expect(movies[1].title, 'Shrek');
    });

    test('getMovieById returns matching movie', () {
      final MovieRepository repository = MovieRepository();

      final Movie? movie = repository.getMovieById('bee-movie');

      expect(movie, isNotNull);
      expect(movie?.title, 'Bee Movie');
      expect(movie?.ageRating, 'PG');
    });

    test('getMovieById returns null when movie does not exist', () {
      final MovieRepository repository = MovieRepository();

      final Movie? movie = repository.getMovieById('does-not-exist');

      expect(movie, isNull);
    });

    test('loadMoviesFromAsset reads bundled JSON movies', () async {
      final MovieRepository repository = MovieRepository();

      final List<Movie> movies = await repository.loadMoviesFromAsset();

      expect(movies.length, 2);

      expect(movies[0].id, 'bee-movie');
      expect(movies[0].title, 'Bee Movie');
      expect(movies[0].ticketPrice, 7.50);

      expect(movies[1].id, 'shrek');
      expect(movies[1].title, 'Shrek');
      expect(movies[1].ticketPrice, 7.50);

      expect(repository.getMovies(), movies);
    });
  });
}
