// in the app
import 'package:app_design_home_screen/widgets/root/theme.dart';

// by flutter
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar({
    Key? key,
    required this.context,
    this.leading,
    required this.title,
    this.actions,
  }) : super(key: key);

  final BuildContext context;
  final Widget? leading;
  final Widget title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: AppTheme.textColor.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(1, 1))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left
          Row(
            children: [if (leading != null) leading!, title],
          ),
          // right
          if (actions != null) Row(children: actions!)
        ],
      ),
    );
  }
}
