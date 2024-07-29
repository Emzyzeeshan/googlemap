import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import '../providers/app_provider.dart';
import 'maps_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    void _login() {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (email.isEmpty) {
        AnimatedSnackBar.material(
          'Error Email is required',
          type: AnimatedSnackBarType.error,
          duration: Duration(seconds: 3),
        ).show(context);
        return;
      }

      if (password.isEmpty) {
        AnimatedSnackBar.material(
          'Error Password is required',
          type: AnimatedSnackBarType.error,
          duration: Duration(seconds: 3),
        ).show(context);
        return;
      }

      // Proceed with login if both fields are filled
      appProvider.login(email, password);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MapsScreen()),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
