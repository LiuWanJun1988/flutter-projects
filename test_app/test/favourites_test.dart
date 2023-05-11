import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/favorites.dart';
import 'package:test_app/screens/favorites.dart';

Favorites favoritesList;

Widget createFavoritesScreen() => ChangeNotifierProvider<Favorites>(
  create: (context) {
    favoritesList = Favorites();
    return favoritesList;
  },
  child: MaterialApp(
    home: FavoritesPage(),
  ),
);

void addItems() {
  for (var i = 0; i < 10; i +=2) {
    favoritesList.add(i);
  }
}

void main() {
  group('App Provider Tests', () {
    var favorites = Favorites();

    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('The item should be removed', () {
      var number = 35;
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });

  group('Favorites Page Widget Tests', () {
    testWidgets('Test if ListView shows up', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());
      addItems();
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing Remove Button', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());
      addItems();
      await tester.pumpAndSettle();
      var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;
      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      expect(tester.widgetList(find.byIcon(Icons.close)).length, lessThan(totalItems));
      expect(find.text('Removed from favorites.'), findsOneWidget);
    });
  });
}