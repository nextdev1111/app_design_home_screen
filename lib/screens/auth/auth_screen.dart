// in the app
import 'package:app_design_home_screen/screens/screens.dart';
import 'package:app_design_home_screen/utils/auth/auth_state.dart';
import 'package:app_design_home_screen/widgets/widgets.dart';

// packages
import 'package:lottie/lottie.dart' as lottie;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_flutter;

//  by flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends AuthState<AuthScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: AppTheme.primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // animation
                  SizedBox(
                    height: 300,
                    child: lottie.Lottie.network(AppTheme.authScreenAnimation),
                  ),
                  // tag lines
                  const SizedBox(
                    height: 40,
                  ),
                  const Text('Develop the hygiene of your mind',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.textColor)),
                  Text('This world won\'t wait long',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600)),
                  const SizedBox(
                    height: 10,
                  ),

                  // container in between tagline and login buttons
                  Container(
                    width: 50,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20)),
                  ),

                  // buttons
                  const SizedBox(height: 20),
                  AppMaterialButton(
                    icon: 'assets/icons/google.svg',
                    text: 'Continue with Google',
                    onTap: () {
                      supabase_flutter.Supabase.instance.client.auth
                          .signInWithProvider(supabase_flutter.Provider.google,
                              options: supabase_flutter.AuthOptions(
                                  redirectTo:
                                      'io.supabase.flutterquickstart://login-callback/'));
                    },
                  ),
                  const SizedBox(height: 20),
                  const Align(
                      alignment: Alignment(-1, 0),
                      child: Text('or continue with email')),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: AppMaterialButton(
                          text: 'Register',
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const RegisterAuthScreen()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: AppMaterialButton(
                          text: 'Login',
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const LoginAuthScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
