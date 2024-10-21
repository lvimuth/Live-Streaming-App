import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Stream',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Join the live streaming revolution and connect with your audience seamlessly. Sign in with Google to get started.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/live.png',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const Text(
              'Sign in with Google to get started',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
