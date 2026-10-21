import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/router/app_router.dart';
import 'package:my_portfolio/core/theme/app_theme.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/cubit/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = Breakpoints.of(context);
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: MediaQuery.withClampedTextScaling(
        maxScaleFactor: 1,
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => MaterialApp.router(
            theme: AppTheme.light(deviceType),
            darkTheme: AppTheme.dark(deviceType),
            themeMode: themeMode,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'Osama Kamel | Flutter Developer',
            locale: const Locale('en'),
          ),
        ),
      ),
    );
  }
}
