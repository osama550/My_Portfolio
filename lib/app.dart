import 'package:flutter/material.dart';
import 'package:my_portfolio/core/router/app_router.dart';
import 'package:my_portfolio/core/theme/app_theme.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = Breakpoints.of(context);
    return MediaQuery.withClampedTextScaling(
      maxScaleFactor: 1,
      child: MaterialApp.router(
        theme: AppTheme.theme(deviceType),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'my_portfolio',
        locale: const Locale('en'),
      ),
    );
  }
}
