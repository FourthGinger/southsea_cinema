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
      expect(
        movie.synopsis,
        'Laika stop motion film about a boy and his instrument.',
      );
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

    test('Movie converts to and from JSON', () {
      final json = <String, dynamic>{
        'id': '1',
        'title': 'Kubo and the two strings',
        'synopsis': 'Laika stop motion film about a boy and his instrument.',
        'ageRating': 'PG',
        'screeningTime': 'Friday 6 Nov 2026 15:00',
        'ticketPrice': 6.00,
        'posterImagePath': 'assets/images/Kubo.jpg',
      };

      final movie = Movie.fromJson(json);

      expect(movie.id, '1');
      expect(movie.title, 'Kubo and the two strings');
      expect(
        movie.synopsis,
        'Laika stop motion film about a boy and his instrument.',
      );
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, 'Friday 6 Nov 2026 15:00');
      expect(movie.ticketPrice, 6.00);
      expect(movie.posterImagePath, 'assets/images/Kubo.jpg');

      expect(movie.toJson(), json);
    });

    test('Movie converts whole-number JSON prices to double', () {
      final json = <String, dynamic>{
        'id': '1',
        'title': 'Kubo and the two strings',
        'synopsis': 'Laika stop motion film about a boy and his instrument.',
        'ageRating': 'PG',
        'screeningTime': 'Friday 6 Nov 2026 15:00',
        'ticketPrice': 6,
        'posterImagePath': 'assets/images/Kubo.jpg',
      };

      final movie = Movie.fromJson(json);

      expect(movie.ticketPrice, isA<double>());
      expect(movie.ticketPrice, 6.0);
    });
  });
}
