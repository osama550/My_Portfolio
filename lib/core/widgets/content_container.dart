import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

/// Centers [child] in the 1120px content column with fluid side gutters.
class ContentContainer extends StatelessWidget {
  const ContentContainer({
    super.key,
    required this.child,
    this.top = 0,
    this.bottom = 0,
  });

  final Widget child;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            context.fluid(20, 5, 48),
            top,
            context.fluid(20, 5, 48),
            bottom,
          ),
          child: child,
        ),
      ),
    );
  }
}
