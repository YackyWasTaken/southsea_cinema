import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie = Movie(
  id: 'test-movie',
  title: 'Test Movie',
  synopsis: 'A movie used for testing.',
  ageRating: 'PG',
  runtime: '90 mins',
  screeningTime: '18:00',
  ticketPrice: 7.50,
  imagePath: 'assets/images/test.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with an empty basket', () {
      final BasketRepository basket = BasketRepository.instance;

      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.getTotal(), 0.0);
    });

    test('adds tickets and calculates total correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      const BasketItem item = BasketItem(
        movie: testMovie,
        quantity: 2,
      );

      basket.addItem(item);

      expect(basket.getItems().length, 1);
      expect(basket.getTotalItems(), 2);
      expect(basket.getTotal(), 15.00);
    });

    test('removes tickets correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      const BasketItem item = BasketItem(
        movie: testMovie,
        quantity: 1,
      );

      basket.addItem(item);

      expect(basket.getItems().length, 1);

      basket.removeItem(0);

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('clears all tickets', () {
      final BasketRepository basket = BasketRepository.instance;

      const BasketItem item = BasketItem(
        movie: testMovie,
        quantity: 2,
      );

      basket.addItem(item);
      basket.clear();

      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.getTotal(), 0.0);
    });
  });
}