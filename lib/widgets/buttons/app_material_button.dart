// in the app
import 'package:app_design_home_screen/widgets/widgets.dart';

// packages
import 'package:flutter_svg/flutter_svg.dart' as flutter_svg;

// by flutter
import 'package:flutter/material.dart';

class AppMaterialButton extends StatefulWidget {
  const AppMaterialButton({
    Key? key,
    this.icon,
    required this.text,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.textColor = AppTheme.textColor,
  }) : super(key: key);

  final String? icon;
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color? textColor;

  @override
  State<AppMaterialButton> createState() => _AppMaterialButtonState();
}

class _AppMaterialButtonState extends State<AppMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppTheme.textColor.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 4))
        ],
      ),
      child: Material(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          onTap: widget.onTap,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null)
                    flutter_svg.SvgPicture.asset(
                      widget.icon!,
                      width: 30,
                      height: 30,
                    ),
                  const Spacer(),
                  Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: 20,
                        color: widget.textColor ?? AppTheme.textColor),
                  ),
                  const Spacer(),
                ],
              )),
        ),
      ),
    );
  }
}
