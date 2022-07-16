import 'package:app_design_home_screen/widgets/root/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Shimmer.fromColors(
          baseColor: Colors.black.withOpacity(1),
          highlightColor: Colors.black.withOpacity(0.5),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.04),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: AppTheme.textColor.withOpacity(0.05),
                      offset: const Offset(0, 4),
                      blurRadius: 20)
                ]),
          ),
        ),
      ),
    );
  }
}
