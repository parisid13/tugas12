// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tugas12/main.dart';

void main() {
  testWidgets('Counter Provider increments test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ActivityProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => CounterProvider()),
        ],
        child: const ToDoApp(),
      ),
    );

    // Wait for navigation and initial load
    await tester.pumpAndSettle();

    // Navigate to profile page to see counter
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    // Verify counter starts at 0
    expect(find.text('0'), findsWidgets);

    // Tap increment button
    final incrementBtn = find.byWidgetPredicate(
      (widget) => widget is ElevatedButton,
    );
    await tester.tap(incrementBtn.first);
    await tester.pumpAndSettle();

    // Verify counter incremented to 1
    expect(find.text('1'), findsWidgets);
  });

  testWidgets('Login page renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ActivityProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => CounterProvider()),
        ],
        child: const ToDoApp(),
      ),
    );

    await tester.pumpAndSettle();

    // Verify email field exists
    expect(find.byType(TextFormField), findsWidgets);

    // Verify login button exists
    expect(find.byType(ElevatedButton), findsWidgets);
  });

  testWidgets('Register page navigation', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ActivityProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => CounterProvider()),
        ],
        child: const ToDoApp(),
      ),
    );

    await tester.pumpAndSettle();

    // Register page should be shown by default (initialRoute: '/register')
    expect(find.text('Register'), findsOneWidget);
    expect(find.byType(TextFormField), findsWidgets);
  });
}
