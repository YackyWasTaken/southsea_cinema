import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

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

  testWidgets(
    'BasketView displays empty message when basket has no items',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BasketView(),
        ),
      );

      expect(find.text('Your basket is empty'), findsOneWidget);
      expect(find.text('Checkout'), findsNothing);
    },
  );

  testWidgets(
    'BasketView renders items and removes item when delete pressed',
    (WidgetTester tester) async {
      const BasketItem item = BasketItem(
        movie: testMovie,
        quantity: 2,
      );

      BasketRepository.instance.addItem(item);

      await tester.pumpWidget(
        const MaterialApp(
          home: BasketView(),
        ),
      );

      expect(find.text('Your basket'), findsOneWidget);
      expect(find.text('2 x Test Movie'), findsOneWidget);
      expect(find.text('£15.00'), findsWidgets);
      expect(find.text('Checkout'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);
    },
  );
}