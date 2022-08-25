import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    _animation = Tween<double>(
      begin:  Size(100,100).longestSide,
      end:    Size(120,120).longestSide
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn)
    ) as Animation<double>;

    _controller.addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed){
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
        child: AnimatedBuilder(animation: _animation,
        builder: (ctx,ch) => SizedBox(
          width: _animation.value,
            height: _animation.value,

            child: Image.asset('assets/images/img.jpg'),
        ),
        )
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
