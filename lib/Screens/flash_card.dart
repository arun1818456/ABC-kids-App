import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../Constants/app_data.dart';
import '../Constants/color_style.dart';

class FlashCardScreen extends StatefulWidget {
  static const route = "flash-card";
  const FlashCardScreen({Key? key}) : super(key: key);
  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  int index = 0;
  double marval=40;
  @override

bool _animate=true;

@override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    AudioPlayer().dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            height: MediaQuery.of(context).size.height - 90,
            child: stackData(
              context,
              index,
            ),
          ),
          Container(
            height: 90,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.2),
                border: const Border(
                  top: BorderSide(color: Colors.black26, width: 3.0),
                )),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: flashCardData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      this.index = index;
                      // marval=10;
                    });
                    playSound(index);
                  },
                  child: AnimatedContainer(
                    height: 80,
                    width:70,
                    // width:this.index==index? 10:70,
                    decoration: BoxDecoration(
                        color: Color(flashCardData[index]["color"]),
                        border: Border.all(color: Colors.black26, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical:10),
                    // margin: EdgeInsets.symmetric(horizontal: 5, vertical:this.index==index? 40:10),
                    duration: const Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          flashCardData[index]["textUpper"],
                          style: const TextStyle(
                            fontFamily: "SignikaNegative",
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
  playSound(index) async {
    final player = AudioPlayer();
    await player.play(AssetSource(flashCardData[index]["sound"]));
  }
}

Widget stackData(context, indexValue) {
  var meSize = MediaQuery.of(context).size;
  double a=120;
  double b=450;
  return Stack(
    children: [
      Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(flashCardData[indexValue]["background"]),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                ),

                // Spacer(),
                // AnimatedContainer(
                //   duration: Duration(milliseconds: 1200),
                //   padding: EdgeInsets.only(left: 0),
                //   child: Image(
                //       height: meSize.height - 150,
                //       image: AssetImage(
                //         indexValue%2==0?flashCardData[indexValue]['iconImage']:flashCardData[indexValue]['letterImage'],
                //       )),
                // ),
                // // Spacer(),
                // Image(
                //     height: meSize.height - 150,
                //     image: AssetImage(
                //       indexValue%2==0?flashCardData[indexValue]['letterImage']:flashCardData[indexValue]['iconImage'],
                //     )),
                // Spacer(),
              ],
            ),
            const Spacer(),
            Text(
              flashCardData[indexValue]['tittle'].toString(),
              style:  textAppStyle,
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 1200),
        padding: EdgeInsets.only(left: indexValue%2==0?a:b),
        curve: Curves.elasticOut,
        child: Image(
            height: meSize.height - 150,
            image: AssetImage(
             flashCardData[indexValue]['iconImage'],
            )),
      ),
      // Spacer(),
      AnimatedContainer(
        duration: Duration(milliseconds: 1200),
        padding: EdgeInsets.only(left: indexValue%2==0?b:a),
        curve: Curves.elasticOut,
        child: Image(
            height: meSize.height - 150,
            image: AssetImage(
             flashCardData[indexValue]['letterImage'],
            )),
      ),
    ],
  );
}
