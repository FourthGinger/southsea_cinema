
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        id: '1',
        title: 'Kubo and the two strings',
        synopsis:
            'Laika stop motion film about a boy and his instrument.',
        ageRating: 'PG',
        screeningTime: 'Friday 6 Nov 2026 15:00',
        ticketPrice: 6.00,
        posterImagePath: 'assets/images/Kubo.jpg',
      ),
      Movie(
        id: '2',
        title: 'The Lord of the Rings: Return of the King',
        synopsis:
            'Third installment in the Lord of the Rings trilogy.',
        ageRating: '12A',
        screeningTime: 'Sunday 4 Oct 2026 18:00',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/ROTK.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (Movie movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
