import 'package:abc_kids/Constants/color_style.dart';
import 'package:abc_kids/Screens/lower_case/lower_letter.dart';
import 'package:abc_kids/Screens/quiz/toch_play_quiz.dart';
import 'package:flutter/material.dart';
import '../upper_case/capital_letter.dart';
import '../match/dragndrop.dart';
import '../flash_card/flash_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = "/";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    List homeDataValues = [
      {"navigate": (){Navigator.pushNamed(context, FlashCardScreen.route);},"tittle":"Flash Cards","image":"assets/cards/1.png"},
      {"navigate": (){Navigator.pushNamed(context, CapitalLetterCardPage.route);},"tittle":"Flash Cards","image":"assets/cards/2.png"},
      {"navigate": (){Navigator.pushNamed(context, lowerLetterCardPage.route);},"tittle":"Flash Cards","image":"assets/cards/3.png"},
      {"navigate": (){Navigator.pushNamed(context, TouchLetter.route);},"tittle":"Flash Cards","image":"assets/cards/4.png"},
      {"navigate": (){Navigator.pushNamed(context, DragAndDropScreen.route);},"tittle":"Flash Cards","image":"assets/cards/4.png"},

    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 120,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0XFF38a45d), width: 3.0),
                  bottom: BorderSide(color: Color(0XFF38a45d), width: 3.0),
                ),
                color: scrollingListColor,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeDataValues.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: homeDataValues[index]["navigate"],
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("${homeDataValues[index]["image"]}")),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 1.0,
                              offset: Offset(1, 2)),
                        ],
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      width: 150,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
