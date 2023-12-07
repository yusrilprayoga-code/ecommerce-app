import 'package:ecommerce_app/sign/enkripsi_helper.dart';
import 'package:ecommerce_app/sign/login.dart';
import 'package:ecommerce_app/sign/user_model.dart';
import 'package:ecommerce_app/sign/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final UserRepository _userRepository = UserRepository();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/login.jpg',
                  height: 250,
                  width: 250,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _usernameController, // Use the controller
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController, // Use the controller
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller:
                        _confirmPasswordController, // Use the controller
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _signup();
                      },
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signup() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();

    if (username.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        String encryptedPassword = CryptoHelper.encrypt(password);

        User newUser = User(username: username, password: encryptedPassword);

        await _userRepository.addUser(newUser);

        print('Sign up successful');

        // Munculkan Snackbar "Sign Up Success"
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign Up success'),
            duration: Duration(seconds: 2),
          ),
        );

        // Navigasi langsung ke halaman login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        // Munculkan Snackbar "Confirm Password must be the same as the password"
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Confirm Password must be the same as the password'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else if (username.isEmpty) {
      // Munculkan Snackbar "Please Input Username"
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please Input Username'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Munculkan Snackbar "Please enter password and confirm password"
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter password and confirm password'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
