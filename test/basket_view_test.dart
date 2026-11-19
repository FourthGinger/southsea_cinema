
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  testWidgets('BasketView displays empty message', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: BasketView()),
    );

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('BUY TICKETS'), findsNothing);
  });

  testWidgets('BasketView displays and removes tickets', (tester) async {
    final movie = MovieRepository().getMovies().first;

    CartRepository.instance.addItem(
      CartItem(movie: movie, quantity: 2),
    );

    await tester.pumpWidget(
      const MaterialApp(home: BasketView()),
    );

    expect(find.text('MY ORDER'), findsOneWidget);
    expect(find.text('2 Tickets'), findsOneWidget);
    expect(find.text('£12.00'), findsOneWidget);
    expect(find.text('£4.00'), findsOneWidget);
    expect(find.text('£16.00'), findsOneWidget);
    expect(find.text('UPDATE ORDER'), findsOneWidget);
    expect(find.text('BUY TICKETS'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(CartRepository.instance.getItems(), isEmpty);
  });
}
