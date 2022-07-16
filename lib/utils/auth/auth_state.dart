// in the app
import 'package:app_design_home_screen/screens/auth/auth_screen.dart';
import 'package:app_design_home_screen/screens/root_screen.dart';
import 'package:app_design_home_screen/constants/constants.dart';

// packages
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_flutter;

// by flutter
import 'package:flutter/cupertino.dart';

class AuthState<T extends StatefulWidget>
    extends supabase_flutter.SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      print('ucated');
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (route) => const AuthScreen()));
    }
  }

  @override
  void onAuthenticated(supabase_flutter.Session session) async {
    if (mounted) {
      print('onAuthenticated');
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (route) => const RootScreen()));
    }
  }

  @override
  void onPasswordRecovery(supabase_flutter.Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    context.showErrorSnackBar(message: message);
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (route) => const AuthScreen()));
  }
}
