import 'package:flutter/material.dart';
import 'package:live_stream_app/pages/home_page.dart';
import 'package:live_stream_app/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await AuthService().signInWithGoogle();
      // Navigate to MainPage only if sign-in is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Error signing in with Google: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.orangeAccent,
              ),
              onPressed: _isLoading ? null : _signInWithGoogle,
              child: _isLoading
                  ? const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Signing in...',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          CircularProgressIndicator(),
                        ],
                      ),
                    )
                  : const Text(
                      'Sign in with Google',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
