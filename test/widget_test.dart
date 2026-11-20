import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });

  group('App smoke tests', () {
    testWidgets(
      'SouthseaCinemaApp displays home page with movie cards',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());

        // Wait for movies.json to finish loading.
        await tester.pumpAndSettle();

        expect(find.byType(HomeView), findsOneWidget);
        expect(find.text('Southsea Cinema'), findsOneWidget);

        expect(find.byType(MovieCard), findsNWidgets(2));

        expect(find.text('Bee Movie'), findsOneWidget);
        expect(find.text('Shrek'), findsOneWidget);

        expect(find.text('Book'), findsNWidgets(2));
      },
    );

    testWidgets(
      'Booking button opens selected movie and adds ticket to order',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());

        // Wait for movies.json to finish loading.
        await tester.pumpAndSettle();

        await tester.tap(find.text('Book').first);
        await tester.pumpAndSettle();

        expect(find.byType(MovieListing), findsOneWidget);

        expect(find.text('91 mins'), findsOneWidget);
        expect(find.text('PG'), findsOneWidget);
        expect(find.text('Screening time: 18:00'), findsOneWidget);
        expect(find.text('Ticket price: £7.50'), findsOneWidget);

        await tester.tap(find.text('Add to order'));
        await tester.pump();

        expect(
          find.text('1 ticket(s) added to order for Bee Movie'),
          findsOneWidget,
        );
      },
    );
  });
}