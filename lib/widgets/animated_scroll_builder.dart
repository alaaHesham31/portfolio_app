import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset offset;

  const ScrollAnimatedWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.offset = const Offset(0, 50),
  });

  @override
  State<ScrollAnimatedWidget> createState() => _ScrollAnimatedWidgetState();
}

class _ScrollAnimatedWidgetState extends State<ScrollAnimatedWidget> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.child.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      //  IMPORTANT: keep the child in the tree (with opacity), not SizedBox
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: _isVisible ? 1.0 : 0.0,
        child: Transform.translate(
          offset: _isVisible ? Offset.zero : widget.offset,
          child: widget.child,
        ),
      ),
    );
  }
}
