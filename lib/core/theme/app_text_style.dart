import 'package:flutter/material.dart';
import 'package:flutter_animations/core/responsive/responsive.dart';

class AppTextStyle {
  static TextStyle splashText(BuildContext context) => TextStyle(
    fontSize: ResponsiveHelper.text(context, 0.092),
    fontFamily: 'AbrilFatface',
  );

  static TextStyle title(BuildContext context) => TextStyle(
    fontSize: ResponsiveHelper.text(context, 0.045),
    color: Colors.indigo,
    height: 1.8,
    fontWeight: FontWeight.bold,
    fontFamily: 'AbrilFatface',
  );

  static TextStyle subtitle(BuildContext context) => TextStyle(
    fontSize: ResponsiveHelper.text(context, 0.037),
    fontWeight: FontWeight.bold,
    height: 1.5,
    fontFamily: 'Kurale',
  );

  static TextStyle detailText(BuildContext context) => TextStyle(
    fontSize: ResponsiveHelper.text(context, 0.045),
    fontWeight: FontWeight.bold,
    color: Colors.indigo,
    height: 2.0,
    fontFamily: 'Kurale',
  );
}
