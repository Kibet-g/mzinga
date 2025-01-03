import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:mzinga/views/auth/sign_in_screen.dart';
import 'package:mzinga/views/auth/sign_up_screen.dart';
import 'package:mzinga/views/home/home_screen.dart';
import 'package:mzinga/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authController = AuthController();

  runApp(MyApp(authController: authController));
}

class MyApp extends StatelessWidget {
  final AuthController authController;

  const MyApp({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mzinga',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomeScreen(authController: authController);
            } else {
              return SignInScreen(authController: authController);
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      routes: {
        '/signUp': (context) => SignUpScreen(authController: authController),
        '/home': (context) => HomeScreen(authController: authController),
      },
    );
  }
}
