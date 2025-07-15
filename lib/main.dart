import 'package:expense_tracker/views/expenses_view/expenses_view.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(31, 117, 128, 193),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(31, 47, 56, 107),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        // appBarTheme: const AppBarTheme().copyWith(
        //   backgroundColor: kColorScheme.onPrimaryContainer,
        //   foregroundColor: kColorScheme.primaryContainer,
        // ),
        // cardTheme: const CardTheme().copyWith(
        //   color: kColorScheme.secondaryContainer,
        // ),
        // iconTheme: ThemeData().iconTheme.copyWith(
        //       color: kColorScheme.onPrimaryContainer,
        //     ),
      ),
      themeMode: ThemeMode.system,
      home: const ExpensesView(),
    ),
  );
}
