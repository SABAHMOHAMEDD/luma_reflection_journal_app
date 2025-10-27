import 'package:flutter/material.dart';

class FloatingIcon extends StatefulWidget {
  final String iconAsset;
  final double size;
  final double iconPadding;
  final Color backgroundColor;
  final Color shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final double animationDistance;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool shouldAnimate;

  const FloatingIcon({
    super.key,
    required this.iconAsset,
    this.size = 100,
    this.iconPadding = 18,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.black,
    this.shadowBlurRadius = 20,
    this.shadowOffset = const Offset(0, 10),
    this.animationDistance = 10,
    this.animationDuration = const Duration(milliseconds: 800),
    this.animationCurve = Curves.easeInOut,
    this.shouldAnimate = true,
  });

  @override
  State<FloatingIcon> createState() => _FloatingIconState();
}

class _FloatingIconState extends State<FloatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (widget.shouldAnimate) {
      _controller = AnimationController(
        duration: widget.animationDuration,
        vsync: this,
      )..repeat(reverse: true);
      
      _animation = Tween<double>(
        begin: 0,
        end: widget.animationDistance,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: widget.animationCurve,
      ));
    }
  }

  @override
  void dispose() {
    if (widget.shouldAnimate) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      width: widget.size,
      height: widget.size,
     
      child: Padding(
        padding: EdgeInsets.all(widget.iconPadding),
        child: Image.asset(
          widget.iconAsset,
          fit: BoxFit.contain,
        ),
      ),
    );

    if (!widget.shouldAnimate) {
      return content;
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: child,
        );
      },
      child: content,
    );
  }
}