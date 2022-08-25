import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme.dart';

class ThemeState {
  final Icon icon;
  final ThemeData theme;

  ThemeState({
    required this.theme,
    required this.icon,
  });
}
