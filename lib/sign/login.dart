import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:ecommerce_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool obsecureText = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late SharedPreferences sharedPreferences;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    newUser = (sharedPreferences.getBool('login') ?? true); // Add "?"
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }

  String calculateMD5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  void printHashForAdminPassword() {
    String hashedPassword = calculateMD5('admin');
    print('Hashed Password for Admin: $hashedPassword');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.jpg'),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Username',
                      hintText: 'Enter your Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: obsecureText,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obsecureText = !obsecureText;
                              });
                            },
                            icon: Icon(
                              obsecureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey[600],
                            )),
                        contentPadding: EdgeInsets.symmetric(vertical: 15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      sharedPreferences.setBool('login', false);
                      sharedPreferences.setString(
                          'username', _usernameController.text);
                      if (_usernameController.text == 'admin' &&
                          _passwordController.text == 'admin') {
                        printHashForAdminPassword();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Login Success'),
                          backgroundColor: Colors.green,
                        ));
                      } else {
                        String hashedPassword =
                            calculateMD5(_passwordController.text);
                        print('Hashed Password: $hashedPassword');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Login Failed'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
