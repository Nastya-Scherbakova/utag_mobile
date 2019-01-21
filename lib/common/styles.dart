import 'package:flutter/widgets.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class CommonStyles {
  static Gradient primaryGradient = Gradients.buildGradient(Alignment(-1, 0), Alignment(0.5, 0.5), [Color.fromRGBO(78, 84, 200, 1), Color.fromRGBO(143, 148, 251, 1)]);
  static const Color primaryColor = Color.fromRGBO(78, 84, 200, 1);
  static const Color secondaryColor = Color.fromRGBO(143, 148, 251, 1);
}