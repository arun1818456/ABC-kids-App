import 'package:flutter/material.dart';
import '../Screens/capital_letter.dart';
import '../Screens/dragndrop.dart';
import '../Screens/flash_card.dart';
import '../Screens/home_screen.dart';
import '../Screens/lower_letter.dart';
import '../Screens/splash_screen.dart';
import '../Screens/toch_play_quiz.dart';

Map<String, Widget Function(BuildContext)> route = {
  HomeScreen.route:(context) => const HomeScreen(),
  FlashCardScreen.route:(context) => const FlashCardScreen(),
  CapitalLetterCardPage.route:(context) => const CapitalLetterCardPage(),
  TouchLetter.route:(context) => const TouchLetter(),
  DragAndDropScreen.route:(context) => const DragAndDropScreen(),
  lowerLetterCardPage.route:(context) => const lowerLetterCardPage(),
  SplashPage.route:(context) => const SplashPage(),
};
