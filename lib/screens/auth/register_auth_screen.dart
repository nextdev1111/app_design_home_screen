// in the app
import 'package:app_design_home_screen/screens/screens.dart';
import 'package:app_design_home_screen/widgets/widgets.dart';
import 'package:app_design_home_screen/constants/constants.dart';
import 'package:app_design_home_screen/utils/utils.dart';
import 'package:flutter/foundation.dart';

// packages
import 'package:flutter_svg/flutter_svg.dart' as flutter_svg;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_flutter;
import 'package:touchable_opacity/touchable_opacity.dart' as touchable_opacity;

// by flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegisterAuthScreen extends StatefulWidget {
  const RegisterAuthScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAuthScreen> createState() => RegisterAuthScreenState();
}

class RegisterAuthScreenState extends State<RegisterAuthScreen> {
  // controllers for text
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // instance of supabase auth manager
  SupabaseAuthManager supabaseAuthManager = SupabaseAuthManager();

  @override
  void dispose() {
    super.dispose();
    // disposing the text inputs
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getAppBar(context),
            getBody(context: context),
          ],
        ),
      ),
    );
  }

  Widget getAppBar(BuildContext context) {
    return AppAppBar(
      context: context,
      leading: AppIconButton(
        icon: 'assets/icons/close.svg',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      title: const Text('Register',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }

  Widget getBody({required BuildContext context}) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: flutter_svg.SvgPicture.asset(
                    'assets/illustrations/authScreenMan.svg'),
              ),
              AppTextField(
                hintText: 'Enter your email please',
                prefixIcon: Icons.alternate_email,
                controller: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                hintText: 'Enter your password please',
                prefixIcon: Icons.lock_outlined,
                controller: _passwordController,
                hideText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                hintText: 'Re enter the password to confirm',
                prefixIcon: Icons.lock_outlined,
                controller: _confirmPasswordController,
                hideText: true,
              ),
              const SizedBox(height: 10),
              touchable_opacity.TouchableOpacity(
                activeOpacity: 0.3,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                        builder: (context) => const LoginAuthScreen()),
                  );
                },
                child: Row(
                  children: const [
                    Text('Already a member?'),
                    SizedBox(width: 5),
                    Text(
                      'Login here',
                      style: TextStyle(color: AppTheme.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AppMaterialButton(
                text: 'Register',
                onTap: registerUser,
                backgroundColor: AppTheme.primaryColor,
                textColor: Colors.white,
              ),
              // empty space
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  registerUser() async {
    var email = _emailController.text;
    var password = _passwordController.text;
    var confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty ||
        email == '' ||
        password.isEmpty ||
        password == '' ||
        confirmPassword.isEmpty ||
        confirmPassword == '') {
      context.showErrorSnackBar(message: 'Please fill in credients properly.');
      return;
    }

    if (password != confirmPassword) {
      context.showErrorSnackBar(
          message: 'Confirm Password doesn\'t match the password');
      return;
    }

    supabase_flutter.GotrueResponse res = await supabaseAuthManager
        .signUpWithEmail(email: email, password: password, context: context);

    if (res.error != null) {
      // ignore: use_build_context_synchronously
      context.showErrorSnackBar(message: res.error!.message);
    }

    if (res.error == null) {
      if (!kIsWeb) {
        // ignore: use_build_context_synchronously
        context.showSnackBar(
          message: 'Sent Link for confirmation',
        );
      } else {
        // ignore: use_build_context_synchronously
        context.showSnackBar(
          message: 'Sent Link for confirmation',
        );
      }

      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (route) => const AuthScreen()));
    }
  }
}
