import 'package:chat_app_in_dark_and_light_mode/logic/theme_cubit.dart';
import 'package:chat_app_in_dark_and_light_mode/logic/theme_state.dart';
import 'package:chat_app_in_dark_and_light_mode/screen/welcome/welcome_screen.dart';
import 'package:chat_app_in_dark_and_light_mode/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(context),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: state.theme,
              //theme: lightThemeData(context),
              //darkTheme: darkThemeData(context),
              //themeMode: ThemeMode.system,
              home: const WelcomeScreen()
          );
        },
      ),
    );
  }
}
