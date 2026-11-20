import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test-movie',
        title: 'Test Movie',
        synopsis: 'A test movie synopsis.',
        ageRating: 'PG',
        runtime: '100 mins',
        screeningTime: '18:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/test.jpg',
      );

      expect(movie.id, 'test-movie');
      expect(movie.title, 'Test Movie');
      expect(movie.synopsis, 'A test movie synopsis.');
      expect(movie.ageRating, 'PG');
      expect(movie.runtime, '100 mins');
      expect(movie.screeningTime, '18:00');
      expect(movie.ticketPrice, 7.50);
      expect(movie.imagePath, 'assets/images/test.jpg');
    });

    test('formats ticket prices to two decimal places', () {
      const wholePoundMovie = Movie(
        id: 'whole-pound',
        title: 'Whole Pound Movie',
        synopsis: 'Test synopsis.',
        ageRating: 'PG',
        runtime: '90 mins',
        screeningTime: '17:00',
        ticketPrice: 7.00,
        imagePath: 'assets/images/test.jpg',
      );

      const penceMovie = Movie(
        id: 'with-pence',
        title: 'Pence Movie',
        synopsis: 'Test synopsis.',
        ageRating: 'PG',
        runtime: '95 mins',
        screeningTime: '19:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/test.jpg',
      );

      expect(wholePoundMovie.formattedPrice, '£7.00');
      expect(penceMovie.formattedPrice, '£7.50');
    });
    test('converts Movie from and to JSON correctly', () {
      final Map<String, dynamic> movieJson = <String, dynamic>{
        'id': 'bee-movie',
        'title': 'Bee Movie',
        'synopsis':
            'Barry B. Benson discovers that humans have been stealing and consuming honey.',
        'ageRating': 'PG',
        'runtime': '91 mins',
        'screeningTime': '18:00',
        'ticketPrice': 7.50,
        'imagePath': 'assets/images/bee_movie.jpg',
      };

      final Movie movie = Movie.fromJson(movieJson);

      expect(movie.id, 'bee-movie');
      expect(movie.title, 'Bee Movie');
      expect(
        movie.synopsis,
        'Barry B. Benson discovers that humans have been stealing and consuming honey.',
      );
      expect(movie.ageRating, 'PG');
      expect(movie.runtime, '91 mins');
      expect(movie.screeningTime, '18:00');
      expect(movie.ticketPrice, 7.50);
      expect(movie.imagePath, 'assets/images/bee_movie.jpg');

      expect(movie.toJson(), movieJson);
    });

    test('fromJson converts whole number ticket price to double', () {
      final Map<String, dynamic> movieJson = <String, dynamic>{
        'id': 'test-movie',
        'title': 'Test Movie',
        'synopsis': 'A test movie.',
        'ageRating': 'PG',
        'runtime': '90 mins',
        'screeningTime': '20:00',
        'ticketPrice': 7,
        'imagePath': 'assets/images/test.jpg',
      };

      final Movie movie = Movie.fromJson(movieJson);

      expect(movie.ticketPrice, 7.0);
      expect(movie.ticketPrice, isA<double>());
    });
  });
}
