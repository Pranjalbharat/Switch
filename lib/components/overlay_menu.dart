import 'package:flutter/material.dart';


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

  OverlayMenuPage({required this.score});

  @override
  _OverlayMenuPageState createState() => _OverlayMenuPageState();
}

class _OverlayMenuPageState extends State<OverlayMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your Score',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Score: ${widget.score}',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularButton(
                    image: AssetImage('menu.png'),
                    onPressed: () {
                      // Add onPressed logic for the first button
                    },
                  ),
                  CircularButton(
                    image: AssetImage('cart.png'),
                    onPressed: () {
                      // Add onPressed logic for the second button
                    },
                  ),
                  CircularButton(
                    image: AssetImage('arrow.png'),
                    onPressed: () {
                      // Add onPressed logic for the third button
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
        shape: CircleBorder(), backgroundColor: Colors.blue,
        padding: EdgeInsets.all(15.0),
      ),
      child: CircleAvatar(
        radius: 30.0,
        backgroundImage: image,
      ),
    );
  }
}


