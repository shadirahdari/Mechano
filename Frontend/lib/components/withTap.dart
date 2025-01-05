import 'package:flutter/material.dart';

Widget withTap(Widget content, void Function()? onTap) {
  return onTap != null
      ? GestureDetector(
          onTap: onTap,
          child: content,
        )
      : content;
}
