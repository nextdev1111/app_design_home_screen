// in the app
import 'package:app_design_home_screen/constants/constants.dart';
import 'package:app_design_home_screen/screens/root_screen.dart';

// packages
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_flutter;

// by flutter
import 'package:flutter/cupertino.dart';

class SupabaseAuthManager {
  Future<supabase_flutter.GotrueSessionResponse> signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var trimmedEmail = email.trim();
    var trimmedPassword = password.trim();

    var res = await supabase_flutter.Supabase.instance.client.auth.signIn(
      email: trimmedEmail,
      password: trimmedPassword,
    );

    if (res.error != null) {
      // ignore: use_build_context_synchronously
      context.showErrorSnackBar(message: res.error!.message);
    }

    if (res.user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (route) => const RootScreen()));
    }

    return res;
  }

  Future<supabase_flutter.GotrueSessionResponse> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var trimmedEmail = email.trim();
    var trimmedPassword = password.trim();

    supabase_flutter.GotrueSessionResponse res = await supabase_flutter
        .Supabase.instance.client.auth
        .signUp(trimmedEmail, trimmedPassword,
            options: supabase_flutter.AuthOptions(
                redirectTo: 'io.supabase.flutterquickstart://login-callback/'));

    if (res.error != null) {
      // ignore: use_build_context_synchronously
      context.showErrorSnackBar(message: res.error!.message);
    }

    return res;
  }
}
