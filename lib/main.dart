import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late AnimationController animationController;

  late Animation<double> scaleAnimationValue;
  late Animation<double> rotateAnimationValue;

  bool fabStatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    scaleAnimationValue = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {

        });
      });



    rotateAnimationValue = Tween<double>(begin: 0.0, end: pi/2 ).animate(animationController)
      ..addListener(() {
        setState(() {

        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      floatingActionButton:
        Column(

          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.scale(
              scale: scaleAnimationValue.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: (){

                  },
                  tooltip: "Fab1",
                  backgroundColor: Colors.green,
                  child: Icon(Icons.color_lens_sharp),

                ),
              ),
            ),
            Transform.scale(
              scale: scaleAnimationValue.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),


                  child: FloatingActionButton(
                    onPressed: (){

                    },
                    tooltip: "Fab2",
                    backgroundColor: Colors.orangeAccent,
                    child: Icon(Icons.queue_music_sharp),

                  ),

              ),
            ),
            Transform.rotate(
              angle: rotateAnimationValue.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: (){

                    if (fabStatus) {
                      animationController.reverse();
                      fabStatus = false;

                    }else{
                      animationController.forward();
                      fabStatus = true;
                    }

                  },
                  tooltip: "Fab3",
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.view_headline_sharp),

                ),
              ),
            )
          ],
        )
    );
  }
}
