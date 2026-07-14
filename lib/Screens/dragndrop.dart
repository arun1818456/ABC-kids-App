import 'package:flutter/material.dart';

class DragAndDropScreen extends StatefulWidget {

  const DragAndDropScreen({super.key});
  static const route="dragndrop";
  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {

    bool _isInitialValue=true;

  @override
  Widget build(BuildContext context) {
    // bool isDropped = false;
    String _color = "red";
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
              if(_isInitialValue==false){
              setState(() {
                _isInitialValue=true;
              });
              }else{
                setState(() {
                  _isInitialValue=false;
                });
            }
            print(_isInitialValue);
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            color: Colors.teal,
            constraints: BoxConstraints(
              maxWidth: _isInitialValue ? 100 : 50,
              maxHeight: _isInitialValue ? 100 : 50,
            ),
            child: const SizedBox(width: 100, height: 100),
          ),
        ) ,
      ));

  }
}


//Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             LongPressDraggable(
//               // Data is the value this Draggable stores.
//               data: _color,
//               feedback: Material(
//                 child: Container(
//                   height: 170.0,
//                   width: 170.0,
//                   decoration: const BoxDecoration(
//                     color: Colors.redAccent,
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Dragging',
//                       textScaleFactor: 2,
//                     ),
//                   ),
//                 ),
//               ),
//               childWhenDragging: Container(
//                 height: 150.0,
//                 width: 150.0,
//                 color: Colors.grey,
//                 child: const Center(
//                   child: Text(
//                     'I was here',
//                     textScaleFactor: 2,
//                   ),
//                 ),
//               ),
//               child: Container(
//                 height: 150.0,
//                 width: 150.0,
//                 color: Colors.redAccent,
//                 child: const Center(
//                   child: Text(
//                     'Drag me',
//                     textScaleFactor: 2,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.15,
//             ),
//             // DragTarget(
//             //   builder: (
//             //       BuildContext context,
//             //       List<dynamic> accepted,
//             //       List<dynamic> rejected,
//             //       ) {
//             //     return DottedBorder(
//             //       borderType: BorderType.RRect,
//             //       radius: const Radius.circular(12),
//             //       padding: const EdgeInsets.all(6),
//             //       color: Colors.black,
//             //       strokeWidth: 2,
//             //       dashPattern: const [8],
//             //       child: ClipRRect(
//             //         borderRadius: const BorderRadius.all(Radius.circular(12)),
//             //         child: Container(
//             //           height: 200,
//             //           width: 200,
//             //           color: isDropped ? Colors.redAccent : null,
//             //           child: Center(
//             //               child: Text(
//             //                 !isDropped ? 'Drop here' : 'Dropped',
//             //                 textScaleFactor: 2,
//             //               )),
//             //         ),
//             //       ),
//             //     );
//             //   },
//             //   onAccept: (data) {
//             //     debugPrint('hi $data');
//             //     setState(() {
//             //       isDropped = true;
//             //     });
//             //     debugPrint('hi $isDropped');
//             //   },
//             //   onWillAccept: (data) {
//             //     return data == _color;
//             //   },
//             // ),
//           ],
//         )