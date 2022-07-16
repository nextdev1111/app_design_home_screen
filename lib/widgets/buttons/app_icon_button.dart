// in the app
import 'package:app_design_home_screen/widgets/root/theme.dart';

// packages
import 'package:flutter_svg/flutter_svg.dart' as flutter_svg;

// by flutter
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    this.backgroundColor = AppTheme.backgroundColor,
    required this.onTap,
    required this.icon,
    this.iconColor = Colors.black,
  }) : super(key: key);

  final Color backgroundColor;
  final VoidCallback onTap;
  final String icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: flutter_svg.SvgPicture.asset(
              icon,
              width: 25,
              height: 25,
            ),
          ),
        ),
      ),
    );
  }
}
