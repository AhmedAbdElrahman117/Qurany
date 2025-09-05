import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation(
      {super.key,
      required this.child,
      required this.animationDuration,
      required this.begin,
      required this.end});

  final Widget child;
  final Duration animationDuration;
  final double begin;
  final double end;

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? fade;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    fade = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(controller!);
    controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fade!,
      builder: (context, child) {
        return FadeTransition(
          opacity: fade!,
          child: widget.child,
        );
      },
    );
  }
}
