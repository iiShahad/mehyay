import 'dart:ui';

import 'package:flutter/widgets.dart';

class Palette {
  static const primary = Color(0xFF6A85B0);
  static const primaryDark = Color(0xFF002171);
  static const primaryLight = Color(0xFF5472D3);
  static const secondary = Color(0xFF880E4F);
  static const secondaryDark = Color(0xFF560027);
  static const secondaryLight = Color(0xFFBC477B);
  static const background = Color(0xFFFAFAFA);
  static const surface = Color(0xFFFFFFFF);
  static const error = Color(0xFFB00020);
  static const onPrimary = Color(0xFFFFFFFF);
  static const onSecondary = Color(0xFFFFFFFF);
  static const onBackground = Color(0xFF000000);
  static const onSurface = Color(0xFF000000);
  static const onError = Color(0xFFFFFFFF);
  static const text = Color(0xFF383543);
  static const textSecondary = Color(0xFF6E6E6E);
  static const textHint = Color(0xFFBDBDBD);
  static const textDisabled = Color(0xFFBDBDBD);
  static const textIcon = Color(0xFFFFFFFF);
  static const divider = Color(0xFFBDBDBD);
  static const shadow = Color(0x1F000000);
  static const transparent = Color(0x00000000);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const grey = Color(0xFF9E9E9E);
  static const greyLight = Color(0xFFE0E0E0);
  static const greyDark = Color(0xFF616161);
  static const blue = Color(0xFF2196F3);
  static const blueLight = Color(0xFFBBDEFB);
  static const blueDark = Color(0xFF1976D2);
  static const red = Color(0xFFE53935);
  static const redLight = Color(0xFFFFCDD2);
  static const redDark = Color(0xFFC62828);
  static const green = Color(0xFF4CAF50);
  static const greenLight = Color(0xFFC8E6C9);
  static const greenDark = Color(0xFF388E3C);
  static const yellow = Color(0xFFFFEB);

  static const boxShadow = [
    BoxShadow(
      color: shadow,
      offset: Offset(0, 4),
      blurRadius: 5,
    ),
  ];

  static const sBorderRadius = 5.0;
  static const mBorderRadius = 8.0;
  static const lBorderRadius = 15.0;

  static const sInsets = 8.0;
  static const mInsets = 16.0;
  static const lInsets = 24.0;

  static const t1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: text,
  );

  static const t1b = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: text,
  );

  static const h1b = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: text,
  );
  static const h1 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.normal,
    color: text,
  );
  static const label = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: text,
  );
  static const labelb = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: text,
  );
}
