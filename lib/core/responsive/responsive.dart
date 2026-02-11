import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double _w(BuildContext c) => MediaQuery.of(c).size.width;

  static double text(BuildContext c, double fraction) => _w(c) * fraction;

  static double pad(BuildContext c, double fraction) => _w(c) * fraction;

  static double image(BuildContext c, double fraction) => _w(c) * fraction;

  static double radius(BuildContext c, double fraction) => _w(c) * fraction;

  static double icon(BuildContext c, double fraction) => _w(c) * fraction;
}
