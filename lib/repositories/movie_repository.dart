import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'bee-movie',
        title: 'Bee Movie',
        synopsis:
            'Bee movie synopsis.',
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
            'Shrek synopsis.',
        ageRating: 'U',
        runtime: '90 mins',
        screeningTime: '20:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/shrek.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }

    return null;
  }
}