import 'package:corewave_app_task/presentation/resources/fonts_manager.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle(
  FontWeight fontWeight,
  double fontSize,
  Color color,
) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

// light style
TextStyle lightTextStyleManager({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _textStyle(
    FontWeightManager.light,
    fontSize,
    color,
  );
}

// regular style
TextStyle regularTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return _textStyle(
    FontWeightManager.regular,
    fontSize,
    color,
  );
}

// medium style
TextStyle mediumTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return _textStyle(
    FontWeightManager.medium,
    fontSize,
    color,
  );
}

// semi-bold style
TextStyle semiBoldTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return _textStyle(
    FontWeightManager.semibold,
    fontSize,
    color,
  );
}

// bold style
TextStyle boldTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return _textStyle(
    FontWeightManager.bold,
    fontSize,
    color,
  );
}

// semi bold with underline style
TextStyle semiBoldUnderlinedTextStyleManager({
  required Color color,
  double fontSize = FontSizeManager.s12,
}) {
  return TextStyle(
    fontWeight: FontWeightManager.semibold,
    fontSize: fontSize,
    color: color,
    decoration: TextDecoration.underline,
  );
}
