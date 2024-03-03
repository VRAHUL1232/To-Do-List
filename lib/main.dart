import 'package:flutter/material.dart';
import 'package:to_do_list/list_screen.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor:const Color.fromARGB(230, 83, 215, 206),
    primaryContainer: const Color.fromRGBO(82, 211, 216,1),
    error: Colors.black.withOpacity(0.18));

var kDarkTheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    error: Colors.white.withOpacity(0.18));

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkTheme,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kDarkTheme.primary,
        ),
        cardTheme: const CardTheme().copyWith(
            color: kDarkTheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkTheme.primary,
                foregroundColor: kDarkTheme.onPrimary)),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            titleMedium:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            titleSmall: const TextStyle(fontSize: 18),
            bodyLarge:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: Color.fromRGBO(190, 255, 247, 1),
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.primary),
        cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            color: kColorScheme.primaryContainer),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primary,
              foregroundColor: kColorScheme.onPrimary),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.w900,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 27),
            titleMedium: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w600,
                fontSize: 22),
            titleSmall: TextStyle(
                color: kColorScheme.onSecondaryContainer, fontSize: 18),
            bodyLarge: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      home: ItemScreen(),
    ),
  );
}
