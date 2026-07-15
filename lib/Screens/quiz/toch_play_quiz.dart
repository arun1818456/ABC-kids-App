import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import '../../Constants/app_data.dart';
import '../../Constants/color_style.dart';

class TouchLetter extends StatefulWidget {
  const TouchLetter({super.key});
  static const route = "touch-letter";
  @override
  State<TouchLetter> createState() => _TouchLetterState();
}

class _TouchLetterState extends State<TouchLetter> {

  int indexVal=0;
  @override
  void initState() {
       indexVal=DateTime.now().minute;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/backgrounds/jungle.jpg",), fit: BoxFit.fill,)
        ) ,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                const Spacer(),
                const Spacer(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 25,),
                    Text(
                      "Touch ${tochLetterData[indexVal]["touchLetter"]}",
                      style: textAppStyle.copyWith(fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      var data =tochLetterData[indexVal]["img1"];
                      final  value1=data.substring(data.lastIndexOf('/') + 1, data.lastIndexOf('.'));
                      final value2=tochLetterData[indexVal]["touchLetter"];
                      if(value1==value2){
                        setState(() {
                          if(indexVal==70){
                            indexVal=0;
                          }else{
                            indexVal=indexVal+1;
                          }
                        });
                      }else{
                        Vibration.vibrate(duration: 500);
                      }
                    },
                    child: Image.asset(
                      "${tochLetterData[indexVal]["img1"]}",
                      height: 150,
                      width: 150,
                    )),
                GestureDetector(
                  onTap: (){
                    var data =tochLetterData[indexVal]["img2"];
                    final  value1=data.substring(data.lastIndexOf('/') + 1, data.lastIndexOf('.'));
                    final value2=tochLetterData[indexVal]["touchLetter"];
                    if(value1==value2){
                      setState(() {
                        if(indexVal==70){
                          indexVal=0;
                        }else{
                          indexVal=indexVal+1;
                        }
                      });
                    }else{
                      Vibration.vibrate(duration: 500);
                    }
                  },
                  child: Image.asset(
                    "${tochLetterData[indexVal]["img2"]}",
                    height: 150,
                    width: 150,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    var data =tochLetterData[indexVal]["img3"];
                     final  value1=data.substring(data.lastIndexOf('/') + 1, data.lastIndexOf('.'));
                     final value2=tochLetterData[indexVal]["touchLetter"];
                    if(value1==value2){
                      setState(() {
                        if(indexVal==70){
                          indexVal=0;
                        }else{
                        indexVal=indexVal+1;
                        }
                      });
                    }else{
                      Vibration.vibrate(duration: 500);
                    }
                  },
                  child: Image.asset(
                    "${tochLetterData[indexVal]["img3"]}",
                    height: 150,
                    width: 150,
                  ),
                ),
                const Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
