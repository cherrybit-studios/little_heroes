import 'package:flutter/material.dart';

class SlideIn extends StatefulWidget {
  const SlideIn({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<SlideIn> createState() => SlideInState();
}

class SlideInState extends State<SlideIn> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.topCenter,
      scaleY: 1 * animation.value,
      child: widget.child,
    );
  }
}
