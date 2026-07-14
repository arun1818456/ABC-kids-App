import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../Constants/app_data.dart';
class lowerLetterCardPage extends StatefulWidget {
  const lowerLetterCardPage({Key? key}) : super(key: key);
  static const route="lower-letter";
  @override
  State<lowerLetterCardPage> createState() => _lowerLetterCardPageState();
}

class _lowerLetterCardPageState extends State<lowerLetterCardPage> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(fit: StackFit.expand,
          children: [
            Image.asset("assets/backgrounds/nature.jpg",fit: BoxFit.fill,),
            AnimationLimiter(
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                crossAxisCount: 7,
                crossAxisSpacing: 30,
                mainAxisSpacing: 10,
                children: List.generate(flashCardData.length, (index) {
                  bool isTapped = false;

                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    columnCount: 2,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 300),
                      child: GestureDetector(
                        onTap: () {
                          print(isTapped);
                          setState(() {
                            isTapped = !isTapped;
                          });
                          print(isTapped);
                        },
                        child: Container(
                          // margin: EdgeInsets.all(20),
                          height: 80,
                          width: 70,
                          decoration: BoxDecoration(
                            color:Color(flashCardData[index]["color"]),
                            border: Border.all(color: Colors.black26, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                flashCardData[index]["textLower"],
                                style: const TextStyle(
                                  fontFamily: "SignikaNegative",
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(15),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    child: const Center(child: Icon(Icons.home)),
                  ),
                ),
              ],
            )
          ],
        )

    );
  }
}
//GridView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             padding: EdgeInsets.symmetric(horizontal: 80,vertical: 50),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 7, // Number of columns in the grid
//               crossAxisSpacing: 30, // Spacing between columns
//               mainAxisSpacing: 10, // Spacing between rows
//             ),
//             itemCount: flashCardData.length, // Total number of items in the grid
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 height: 80,
//                 width: 70,
//                 decoration: BoxDecoration(
//                     color: Color(flashCardData[index]["color"]),
//                     border: Border.all(color: Colors.black26, width: 2),
//                     borderRadius: BorderRadius.circular(10)),
//
//                 child: Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white, width: 2),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       flashCardData[index]["textUpper"],
//                       style: const TextStyle(
//                         fontFamily: "SignikaNegative",
//                         fontSize: 45,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           )