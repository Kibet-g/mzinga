import 'package:flutter/material.dart';
import 'package:mzinga/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController;

  const HomeScreen({Key? key, required this.authController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authController.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome to Mzinga!"),
      ),
    );
  }
}
