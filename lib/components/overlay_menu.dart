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

class _OverlayMenuPageState extends State<OverlayMenuPage> with SingleTickerProviderStateMixin{
  
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Future<void> _imageLoading;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(13.0, 0.0),
    ).animate(_controller);

    _imageLoading = _loadImageAndStartAnimation();
  }



    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _controller.forward();
    // });
  

    
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

   Future<void> _loadImageAndStartAnimation() async {
    await precacheImage(AssetImage("assets/images/overlay.png"), context);
    _controller.forward();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      
      body: FutureBuilder(future: _imageLoading,
       builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator or placeholder widget
            return Center(
              child: CircularProgressIndicator(),
            );
          }

      
      
      else{
        return
      Stack(
        children: [ Positioned.fill(
                  child: Image.asset(
                    "assets/images/overlay.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
      
        

       
          //Positioned.fill(child: Image.asset("assets/images/overlay.png",fit: BoxFit.fitWidth,),),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height / 2 - 35, // Adjust as needed
            child: SlideTransition(
              position: _animation,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/basketball.png"),
                  ),
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          
          
        Center(
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
                      widget.reset();
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

       /* SlideTransition(position: _animation,
        child: Container(width: 70,
        height: 70,
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/images/basketball.png")),
          color: Colors.black,
          shape: BoxShape.circle
        ),),)*/

        
        
        
        ],

      );
      }
  },
      )
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

/*class BallAnimation extends StatefulWidget {
   //final Alignment alignment;

 // BallAnimation({required this.alignment});
  @override
  _BallAnimationState createState() => _BallAnimationState();
}

class _BallAnimationState extends State<BallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(13.0, 0.0),
    ).animate(_controller);


    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.forward();
    });
     

    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
   return SlideTransition(
      position: _animation,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/basketball.png")),
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }*/
  
  
  
  

