import 'package:flutter/material.dart';

class HomeWork2 extends StatefulWidget {
  const HomeWork2({Key? key}) : super(key: key);

  @override
  State<HomeWork2> createState() => _HomeWork2State();
}

class _HomeWork2State extends State<HomeWork2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.5, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );
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
        title: const Center(child: Text('Flutter Animation')),
      ),
      body: Center(
        child: SlideTransition(

          position: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/ball.jpg'),
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
