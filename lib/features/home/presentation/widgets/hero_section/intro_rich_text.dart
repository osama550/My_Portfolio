import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class IntroRichText extends StatelessWidget {
  final TextAlign textAlign;

  const IntroRichText({super.key, required this.textAlign});

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: typography.h1Bold.copyWith(
          color: ColorsPalette.textPrimary,
          height: 1.2,
        ),
        children: [
          TextSpan(text: "Hi, I'm \n", style: typography.h4Bold),
          TextSpan(
            text: 'Osama Kamel\n',
            style: typography.h2Bold.copyWith(color: ColorsPalette.primary),
          ),
          TextSpan(text: 'Flutter Developer', style: typography.h5Bold),
        ],
      ),
    );
  }
}
