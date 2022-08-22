import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/font_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class PlanetTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  Color? color;
  EdgeInsets? padding;

  PlanetTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: AppPadding.p30),
      ),
      child: Text(title,
          style: TextStyle(
            fontSize: FontSize.s16,
            color: color ?? ColorManager.primary,
          )),
    );
  }
}
