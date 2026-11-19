import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });

  group('App smoke tests', () {
    testWidgets('App displays home page', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.text('Southsea Cinema'), findsOneWidget);
    });

    testWidgets('Displays movie cards and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      // Check the first movie
      expect(find.text('Kubo and the two strings'), findsOneWidget);

      // Check the second movie
      await tester.scrollUntilVisible(
        find.text('The Lord of the Rings: Return of the King'),
        300,
      );

      await tester.pumpAndSettle();

      expect(
        find.text('The Lord of the Rings: Return of the King'),
        findsOneWidget,
      );

      // Check that the booking buttons are displayed
      expect(find.text('BOOK NOW'), findsWidgets);
    });
  });
}
