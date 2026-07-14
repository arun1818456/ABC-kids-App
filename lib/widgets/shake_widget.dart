import 'package:flutter/cupertino.dart';

class ShakeWidget extends StatefulWidget {
  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;
  final Shake;
  const ShakeWidget({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    required this.child,
    this.Shake,
  }) : super(key: key);

  @override
  _ShakeWidgetState createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.5 - (0.5 - widget.curve.transform(animation)).abs());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.Shake == true) {
      _controller.forward(from: 0.0);
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(widget.deltaX * shake(_controller.value), 0),
        child: child,
      ),
      child: widget.child,
    );
  }
}
