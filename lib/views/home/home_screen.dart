// lib/views/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:mzinga/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authController.signOut();
              Navigator.pushReplacementNamed(context, '/signIn');
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Welcome, ${_authController.currentUser?.email ?? 'Guest'}!"),
      ),
    );
  }
}
