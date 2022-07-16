// in the app
import 'package:app_design_home_screen/utils/utils.dart';
import 'package:app_design_home_screen/widgets/root/theme.dart';
import 'package:app_design_home_screen/constants/constants.dart';
// packages
import 'package:lottie/lottie.dart' as lottie;

// by flutter
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends AuthState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: lottie.Lottie.network(AppTheme.splashScreenAnimation)),
    );
  }
}
