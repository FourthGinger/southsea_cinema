import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie', () {
    test('Constructor assigns properties correctly', () {
      final movie = Movie(
        id: '1',
        title: 'Kubo and the two Strings',
        synopsis: 'Laika stop motion film about a boy and his instrument.',
        ageRating: 'PG',
        screeningTime: 'Friday 6 Nov 2026 15:00',
        ticketPrice: 6.0,
        posterImagePath: 'assets/images/Kubo.jpg',
      );

      expect(movie.id, '1');
      expect(movie.title, 'Kubo and the two Strings');
      expect(movie.synopsis, 'Laika stop motion film about a boy and his instrument.');
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, 'Friday 6 Nov 2026 15:00');
      expect(movie.ticketPrice, 6.0);
      expect(movie.posterImagePath, 'assets/images/Kubo.jpg');
    });

    test('formattedPrice displays whole pounds with two decimal places', () {
      final movie = Movie(
        id: '1',
        title: 'Kubo and the two Strings',
        synopsis: 'Laika stop motion film about a boy and his instrument.',
        ageRating: 'PG',
        screeningTime: 'Friday 6 Nov 2026 15:00',
        ticketPrice: 6.0,
        posterImagePath: 'assets/images/Kubo.jpg',
      );

      expect(movie.formattedPrice, '£6.00');
    });

    test('formattedPrice displays pence with two decimal places', () {
      final movie = Movie(
        id: '2',
        title: 'The Lord of the Rings: Return of the King',
        synopsis: 'Third installment in the Lord of the Rings trilogy.',
        ageRating: '12A',
        screeningTime: 'Sunday 4 Oct 2026 18:00',
        ticketPrice: 7.5,
        posterImagePath: 'assets/images/ROTK.jpg',
      );

      expect(movie.formattedPrice, '£7.50');
    });
  });
}