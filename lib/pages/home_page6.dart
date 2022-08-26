import 'package:flutter/material.dart';

class HomePage6 extends StatefulWidget {
  const HomePage6({Key? key}) : super(key: key);

  @override
  State<HomePage6> createState() => _HomePage6State();
}

class _HomePage6State extends State<HomePage6>
    with SingleTickerProviderStateMixin {
  late Animation<double> _rotateAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _rotateAnimation = Tween(end: 0.15, begin: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.bounceInOut),
      ),
    );
    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Flutter Animations'),
        ),
      ),
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx, ch) => Container(
          width: 220,
          height: 100,
          padding: const EdgeInsets.all(0),
          margin: EdgeInsets.only(
            left: 75,
            top: _slideAnimation.value,
          ),
          child: RotationTransition(
            turns: _rotateAnimation,
            child: Center(
              child: Text(
                'Animation',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 128, _opacityAnimation.value)),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.play_arrow),
            onPressed: (){
            _controller.forward();
            },
        ),
    );
  }
}
