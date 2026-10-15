import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
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
}
