import 'dart:ui';

import 'package:car_wash/components/car_background.dart';
import 'package:car_wash/components/input_box.dart';
import 'package:car_wash/components/primary_button.dart';
import 'package:car_wash/components/snak_bar.dart';
import 'package:car_wash/models/auth_response.dart';
import 'package:car_wash/screens/home_screen.dart';
import 'package:car_wash/screens/sign_up_screen.dart';
import 'package:car_wash/services/AuthService.dart';
import 'package:car_wash/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    final AuthService _auth = AuthService();

    String email = _emailController.text;
    String password = _passwordController.text;

    if (!Validator.isEmailValid(email)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackbar(message: "Email is invalid"));
      return;
    }

    if (!Validator.isPasswordValid(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
          MySnackbar(message: "Password must containt at least 6 charactors"));
      return;
    }

    AuthResponse signInResponse =
        await _auth.signInWithEmailAndPassword(email, password);

    if (signInResponse.user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else if (signInResponse.message != null) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: signInResponse.message!,
      ));
    }

    print("Login");
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CarBackground(
          imagePath: "images/background.jpg",
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/logo.png"),
                )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.04,
                        ),
                        InputBox(
                          placeholder: "Email",
                          controller: _emailController,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.04,
                        ),
                        InputBox(
                          placeholder: "Password",
                          controller: _passwordController,
                          isPass: true,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.04,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              text: "LOGIN",
                              onPressed: () async {
                                login();
                              },
                            )),
                        TextButton(
                          onPressed: () => context.go("/sign-up"),
                          child: const Text("Don't have an account? SignUp",
                              style: TextStyle(color: Colors.black54)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
