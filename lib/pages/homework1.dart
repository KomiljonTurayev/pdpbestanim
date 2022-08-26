import 'package:flutter/material.dart';

class Homework1 extends StatefulWidget {
  const Homework1({Key? key}) : super(key: key);

  @override
  State<Homework1> createState() => _Homework1State();
}

class _Homework1State extends State<Homework1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _animation = Tween<double>(
      begin: const Size(100, 100).longestSide,
      end: const Size(100, 200).longestSide,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (ctx, ch) => SizedBox(
            width: _animation.value,
            height: _animation.value,
            child: Image.asset('assets/images/heart.png'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}
