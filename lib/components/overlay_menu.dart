import 'package:flutter/material.dart';
import 'package:switch_off/game.dart';


// /*class OverlayMenuPage extends StatefulWidget {
//   final int score;

//   OverlayMenuPage({required this.score});

//   @override
//   _OverlayMenuPageState createState() => _OverlayMenuPageState();
// }

// class _OverlayMenuPageState extends State<OverlayMenuPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       /*body: Center(
//         child: Text(
//           'Score: ${widget.score}',
//           style: TextStyle(fontSize: 24),
//         ),*/
//       backgroundColor: Colors.red, 
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           decoration: BoxDecoration(
//             color: Colors.orange,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Column(
//             //mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Your Score!',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//           'Score: ${widget.score}',
          
//           style: TextStyle(fontSize: 24,color: Colors.yellow),
        
                
//               ),
//               SizedBox(height: 20.0),
//               Row(children: [
               
//                  CircleAvatar(backgroundImage: AssetImage("menu.png")),
//                  ),
//                 SizedBox(width: 20,),
//                  ElevatedButton(onPressed: (){
                  
//                 },
//                 child: CircleAvatar(backgroundImage: AssetImage("cart.jpg")),),
//                 SizedBox(width: 20,),

//                  ElevatedButton(onPressed: (){
                  
//                 },
//                 child: CircleAvatar(backgroundImage: AssetImage("arrow.webp")),)
//               ],)
//             ],
//           ),
//         ),
//       ),
//       // ),
//     );
//   }
// }
// */

// class OverlayMenuPage extends StatefulWidget {
//   final int score;

//   OverlayMenuPage({required this.score});

//   @override
//   _OverlayMenuPageState createState() => _OverlayMenuPageState();
// }

// class _OverlayMenuPageState extends State<OverlayMenuPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red, 
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           decoration: BoxDecoration(
//             color: Colors.orange,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Column(
//             children: [
//               Text(
//                 'Your Score!',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Score: ${widget.score}',
//                 style: TextStyle(fontSize: 24, color: Colors.yellow),
//               ),
//               SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add onPressed logic for the first circle avatar
//                     },
//                     child: CircleAvatar(
//                       radius: 30.0,
//                       backgroundImage: AssetImage("menu.png"),
//                     ),
//                   ),
//                   SizedBox(width: 20.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add onPressed logic for the second circle avatar
//                     },
//                     child: CircleAvatar(
//                       radius: 30.0,
//                       backgroundImage: AssetImage("cart.png"),
//                     ),
//                   ),
//                   SizedBox(width: 20.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add onPressed logic for the third circle avatar
//                     },
//                     child: CircleAvatar(
//                       radius: 30.0,
//                       backgroundImage: AssetImage("arrow.png"),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class OverlayMenuPage extends StatefulWidget {
  final int score;
  // final SwitchGame switchGame; 
final VoidCallback reset;
  OverlayMenuPage({required this.score, required this.reset});

  @override
  _OverlayMenuPageState createState() => _OverlayMenuPageState();
}

class _OverlayMenuPageState extends State<OverlayMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Center(
        child: Container(
          
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width * 0.6, // 80% of screen width
          decoration: BoxDecoration(
            color: Colors.orange[300],
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              MainText(
                text:
                'Your Score',
                 //backgroundColor: Colors.red, // Background color of the bow
            textColor: Colors.white, // Text color
            height: 80, // Adjust the height of the bow shape
            width: 1000,
                /*style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),*/
              ),
              SizedBox(height: 20.0),
              Text(
                'Score: ${widget.score}',
                style: TextStyle(
                  fontSize: 27.0,
                  color:Colors.red[700] 
                ),
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularButton(
                    image: AssetImage('assets/images/menu.png'),
                    onPressed: () {
                      // Add onPressed logic for the first button
                    },
                  ),
                  CircularButton(
                    image: AssetImage('assets/images/cart.png'),
                    onPressed: () {
                      // Add onPressed logic for the second button
                    },
                  ),
                  CircularButton(
                    image: AssetImage('assets/images/arrow (1).png'),
                    onPressed: () {
                      // Add onPressed logic for the third button
                      widget.reset;
                      // print("executed");
                      // widget.switchGame.resetAllBallsToRed();
                      // print("done");
                        Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final AssetImage image;
  final VoidCallback? onPressed;

  const CircularButton({
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(), backgroundColor: Colors.yellow[900],
        padding: EdgeInsets.all(15.0),
      ),
      child: CircleAvatar(
        radius: 40.0,
        backgroundImage: image,
      ),
    );
  }
}

class MainText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double height;
  final double width;

  const MainText({
    Key? key,
    required this.text,
    required this.textColor,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.orange.shade300, Colors.red, Colors.orange.shade400],
        ),
        borderRadius: BorderRadius.circular(height / 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
