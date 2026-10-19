import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Holds the user's theme choice. Follows the system until toggled.
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  /// Flips between light and dark, relative to what is currently showing.
  void toggle(Brightness current) {
    emit(current == Brightness.dark ? ThemeMode.light : ThemeMode.dark);
  }
}
