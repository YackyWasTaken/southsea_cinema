import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  group('App smoke tests', () {
    testWidgets(
      'SouthseaCinemaApp displays home page with movie cards',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());

        expect(find.byType(HomeView), findsOneWidget);
        expect(find.text('Southsea Cinema'), findsOneWidget);

        expect(find.byType(MovieCard), findsNWidgets(2));

        expect(find.text('Bee Movie'), findsOneWidget);
        expect(find.text('Shrek'), findsOneWidget);

        expect(find.text('Book'), findsNWidgets(2));
      },
    );
  });
}
