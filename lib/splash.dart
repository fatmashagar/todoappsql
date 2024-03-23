import 'package:flutter/material.dart';
import 'package:todoappsql/cachhelper.dart';
import 'package:todoappsql/main.dart';
import 'package:todoappsql/on.dart';


class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),

    );

    _animation = Tween<double>(begin: 1.0, end: -1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
    nav();
  }
  void nav(){
    //bool isvisited=cachehelper().getdata(key: 'onboarding')??false;
    Future.delayed(const Duration(milliseconds: 3450),(){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>on()));
    });
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(_animation.value * -38, 0),
                  child: Text('DO', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                ),
                Transform.translate(
                  offset: Offset(-_animation.value * -38, 0),
                  child: Text('TO', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
