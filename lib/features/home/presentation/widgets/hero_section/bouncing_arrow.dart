import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';

class BouncingArrow extends StatefulWidget {
  final VoidCallback? onTap;

  const BouncingArrow({super.key, this.onTap});

  @override
  State<BouncingArrow> createState() => _BouncingArrowState();
}

class _BouncingArrowState extends State<BouncingArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorsPalette.primary.withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorsPalette.primary.withValues(alpha: 0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_downward,
            color: ColorsPalette.primary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
