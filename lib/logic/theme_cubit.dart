import 'package:chat_app_in_dark_and_light_mode/logic/theme_state.dart';
import 'package:chat_app_in_dark_and_light_mode/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final BuildContext context;
  ThemeCubit(this.context)
      : super(
          ThemeState(
            theme: lightThemeData(context),
            icon: const Icon(Icons.light_mode),
          ),
        );
    void toggleTheme(bool value) => emit(
          ThemeState(
            theme: value ? lightThemeData(context) : darkThemeData(context),
            icon: value ? const Icon(Icons.dark_mode):  const Icon(Icons.light_mode) ,
          ),
        );
}
