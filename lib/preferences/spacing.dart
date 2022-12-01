import 'package:flutter/material.dart';

class Spacing {
  const Spacing._();
  static const SizedBox v2 = SizedBox(height: 2);
  static const SizedBox v4 = SizedBox(height: 4);
  static const SizedBox v8 = SizedBox(height: 8);
  static const SizedBox v12 = SizedBox(height: 12);
  static const SizedBox v16 = SizedBox(height: 16);
  static const SizedBox v24 = SizedBox(height: 24);
  static const SizedBox v32 = SizedBox(height: 32);
  static const SizedBox v40 = SizedBox(height: 40);

  static const SizedBox h2 = SizedBox(width: 2);
  static const SizedBox h4 = SizedBox(width: 4);
  static const SizedBox h8 = SizedBox(width: 8);
  static const SizedBox h12 = SizedBox(width: 12);
  static const SizedBox h16 = SizedBox(width: 16);
  static const SizedBox h24 = SizedBox(width: 24);
  static const SizedBox h32 = SizedBox(width: 32);
  static const SizedBox h40 = SizedBox(width: 40);

  static Divider divider = Divider(
    height: 8,
    thickness: 8,
    color: Colors.grey.withOpacity(0.4),
  );

  static const SizedBox zero = SizedBox.shrink();
}
