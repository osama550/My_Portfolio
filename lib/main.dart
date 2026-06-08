import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/app.dart';
import 'package:my_portfolio/core/utils/classes/app_bloc_observer.dart';
import 'package:my_portfolio/core/utils/functions/remove_splash_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  runApp(const App());

  // Remove the CSS loading screen (web only, no-op on mobile)
  removeSplashScreen();
}
