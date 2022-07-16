// in the app
import 'package:app_design_home_screen/screens/screens.dart';
import 'package:app_design_home_screen/utils/root/routes.dart';
import 'package:app_design_home_screen/widgets/root/theme.dart';

// packages
import 'package:flutter_dotenv/flutter_dotenv.dart' as flutter_dotenv;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_flutter;

// by flutter
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await flutter_dotenv.dotenv.load();

  String supabaseBaseUrl = flutter_dotenv.dotenv.env['SUPABASEBASEURL'] ?? '';
  String supabaseBaseKey = flutter_dotenv.dotenv.env['SUPABASEBASEKEY'] ?? '';

  await supabase_flutter.Supabase.initialize(
      url: supabaseBaseUrl,
      anonKey: supabaseBaseKey,
      authCallbackUrlHostname: 'login-callback',
      debug: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: const SplashScreen(),
      routes: {AppRoutes.rootRoute: (context) => const RootScreen()},
    );
  }
}
