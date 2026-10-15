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
  });
}
