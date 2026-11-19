
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';

void main() {
  final testMovie1 = Movie(
    id: '1',
    title: 'Kubo and the two strings',
    synopsis: 'Laika stop motion film about a boy and his instrument.',
    ageRating: 'PG',
    screeningTime: 'Friday 6 Nov 2026 15:00',
    ticketPrice: 6.00,
    posterImagePath: 'assets/images/Kubo.jpg',
  );

  final testMovie2 = Movie(
    id: '2',
    title: 'The Lord of the Rings: Return of the King',
    synopsis: 'Third installment in the Lord of the Rings trilogy.',
    ageRating: '12A',
    screeningTime: 'Sunday 4 Oct 2026 18:00',
    ticketPrice: 7.50,
    posterImagePath: 'assets/images/ROTK.jpg',
  );

  setUp(() {
    CartRepository.instance.clear();
  });

  group('CartRepository tests', () {
    test('Adding items updates basket contents', () {
      CartRepository.instance.addItem(
        CartItem(movie: testMovie1, quantity: 2),
      );

      expect(CartRepository.instance.getItems().length, 1);
      expect(CartRepository.instance.getTotalItems(), 2);
    });

    test('Calculates basket total correctly', () {
      CartRepository.instance.addItem(
        CartItem(movie: testMovie1, quantity: 2),
      );

      CartRepository.instance.addItem(
        CartItem(movie: testMovie2, quantity: 1),
      );

      expect(CartRepository.instance.getSubtotal(), 19.50);
      expect(CartRepository.instance.getTotalDue(), 19.50);
    });

    test('Removing and clearing items works', () {
      CartRepository.instance.addItem(
        CartItem(movie: testMovie1, quantity: 2),
      );

      CartRepository.instance.addItem(
        CartItem(movie: testMovie2, quantity: 1),
      );

      CartRepository.instance.removeItem(0);

      expect(CartRepository.instance.getItems().length, 1);
      expect(CartRepository.instance.getTotalItems(), 1);

      CartRepository.instance.clear();

      expect(CartRepository.instance.getItems(), isEmpty);
      expect(CartRepository.instance.getTotalDue(), 0.0);
    });
  });
}
