import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

class PlanetElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double borderRadius;
  final double? width;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? colorText;
  final double? elevation;
  final BorderSide? borderSide;
  const PlanetElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.padding,
      this.borderRadius = 6,
      this.width,
      this.backgroundColor,
      this.colorText,
      this.elevation,
      this.borderSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: borderSide,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
                vertical: AppPadding.p18, horizontal: AppPadding.p35),
        primary: backgroundColor ?? ColorManager.primary,
      ),
      child: Container(
        alignment: Alignment.center,
        width: width,
        child: Text(title,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                color: colorText ?? ColorManager.whiteText,
              ),
            )),
      ),
    );
  }
}
