import 'package:flutter/material.dart';
import 'package:switch_off/game.dart';


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:switch_off/game.dart';




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



    //  WidgetsBinding.instance!.addPostFrameCallback((_) {
    //    _controller.forward();
    //  });
  

    
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

            children: [
              SizedBox(height: 75,),
              Text("Your Score",style: TextStyle(
                color: Colors.red,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),),

              SizedBox(height: 20.0),
              Text(
                'Score: ${widget.score}',
                style: TextStyle(
                  fontSize: 27.0,
                  color:Colors.red[200]
                ),
              ),

              SizedBox(height: 40.0),
              Row(
                
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 250,),
                  CircularButton(
                    image: AssetImage('assets/images/menu.png'),
                    onPressed: () {
                      // Add onPressed logic for the first button
                    },
                  ),
                  CircularButton(
                    image: AssetImage('assets/images/shopping.png'),
                    onPressed: () {
                      // Add onPressed logic for the second button
                    },
                  ),
                  CircularButton(
                    image: AssetImage('assets/images/refresh.png'),
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
        shape: 
        CircleBorder(), backgroundColor: Colors.black,
        //padding: EdgeInsets.all(7.0),
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
  
  
  
  
