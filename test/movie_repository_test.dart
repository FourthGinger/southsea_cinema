import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid Kubo and Lord of the Rings films', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie kubo = movies[0];
      expect(kubo.id, '1');
      expect(kubo.title, 'Kubo and the two strings');
      expect(kubo.ticketPrice, 6.00);
      expect(kubo.posterImagePath, isNotEmpty);

      final Movie lotr = movies[1];
      expect(lotr.id, '2');
      expect(lotr.title, 'The Lord of the Rings: Return of the King');
      expect(lotr.ticketPrice, 7.50);
      expect(lotr.posterImagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('1');

      expect(movie, isNotNull);
      expect(movie?.title, 'Kubo and the two strings');
      expect(movie?.ticketPrice, 6.00);
    });
    
    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}