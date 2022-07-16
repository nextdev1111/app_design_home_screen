// in the app
import 'package:app_design_home_screen/screens/screens.dart';
import 'package:app_design_home_screen/utils/utils.dart';
import 'package:app_design_home_screen/widgets/widgets.dart';
import 'package:app_design_home_screen/constants/constants.dart';

// packages
import 'package:flutter_svg/flutter_svg.dart' as flutter_svg;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_flutter;
import 'package:touchable_opacity/touchable_opacity.dart' as touchable_opacity;

// by flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({Key? key}) : super(key: key);

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  // controllers for text
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // instance of supabase auth manager
  SupabaseAuthManager supabaseAuthManager = SupabaseAuthManager();

  // values
  bool _loading = false;

  @override
  void dispose() {
    super.dispose();
    // disposing the text inputs
    _emailController.dispose();
    _passwordController.dispose();
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
      title: const Text('Login',
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
              const SizedBox(height: 10),
              touchable_opacity.TouchableOpacity(
                activeOpacity: 0.3,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                        builder: (context) => const RegisterAuthScreen()),
                  );
                },
                child: Row(
                  children: const [
                    Text('Not a member yet?'),
                    SizedBox(width: 5),
                    Text(
                      'Register here',
                      style: TextStyle(color: AppTheme.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AppMaterialButton(
                text: 'Login',
                onTap: loginUser,
                backgroundColor: AppTheme.primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginUser() async {
    _loading = true;
    setState(() {});
    var email = _emailController.text;
    var password = _passwordController.text;

    if (email.isEmpty || email == '' || password.isEmpty || password == '') {
      context.showErrorSnackBar(message: 'Please fill in credients properly.');
      return;
    }

    supabase_flutter.GotrueSessionResponse res = await supabaseAuthManager
        .signInWithEmail(email: email, password: password, context: context);

    if (res.error != null) {
      context.showSnackBar(message: res.error!.message);
    }

    if (res.error == null) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (route) => const RootScreen()));
    }
  }
}
