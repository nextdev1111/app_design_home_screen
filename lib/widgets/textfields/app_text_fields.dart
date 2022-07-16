// in the app
import 'package:app_design_home_screen/widgets/root/theme.dart';

// by flutter
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    this.hideText = false,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool hideText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: AppTheme.textColor.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(1, 1))
          ]),
      child: Row(children: [
        Icon(
          prefixIcon,
          color: AppTheme.textColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            obscureText: hideText,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        )
      ]),
    );
  }
}
