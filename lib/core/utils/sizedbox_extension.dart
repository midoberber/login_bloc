import 'package:flutter/material.dart';

extension SizedBoxPadding on num {
  SizedBox get sizHeight => SizedBox(
        height: toDouble(),
      );
  SizedBox get sizeWidth => SizedBox(
        width: toDouble(),
      );
}
