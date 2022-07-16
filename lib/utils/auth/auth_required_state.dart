// in the app
import 'package:app_design_home_screen/screens/auth/auth_screen.dart';

// packages
import 'package:supabase_flutter/supabase_flutter.dart';

// by flutter
import 'package:flutter/cupertino.dart';

class AuthRequiredState<T extends StatefulWidget>
    extends SupabaseAuthRequiredState<T> {
  @override
  void onUnauthenticated() {
    /// Users will be sent back to the LoginPage if they sign out.
    if (mounted) {
      /// Users will be sent back to the LoginPage if they sign out.
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (route) => const AuthScreen()));
    }
  }
}
