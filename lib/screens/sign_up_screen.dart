import 'package:car_wash/components/car_background.dart';
import 'package:car_wash/components/input_box.dart';
import 'package:car_wash/components/primary_button.dart';
import 'package:car_wash/components/snak_bar.dart';
import 'package:car_wash/models/auth_response.dart';
import 'package:car_wash/screens/home_screen.dart';
import 'package:car_wash/screens/sign_in_screen.dart';
import 'package:car_wash/services/AuthService.dart';
import 'package:car_wash/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void register() async {
    String fullName = _fullNameController.text;
    String phone = _phoneNoController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    final AuthService _auth = AuthService();

    if (!Validator.isNameValid(fullName)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackbar(message: "Name is invalid"));
      return;
    }

    if (!Validator.isMobileNumberValid(phone)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackbar(message: "Phone no is invalid"));
      return;
    }

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

    if (!Validator.passwordsMatch(password, confirmPassword)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackbar(message: "Passwords do not match"));
      return;
    }

    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
          MySnackbar(message: "You must agree to our terms & condition"));
      return;
    }

    AuthResponse signUpResponse = await _auth.signUpWithEmailAndPassword(
        email, password, fullName, phone);

    if (signUpResponse.message != null) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: signUpResponse.message!,
      ));
    } else if (signUpResponse.user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
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
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35))),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Create Account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.04,
                          ),
                          InputBox(
                            placeholder: "Full Name",
                            controller: _fullNameController,
                          ),
                          SizedBox(
                            height: screenSize.height * 0.04,
                          ),
                          InputBox(
                            placeholder: "Phone No",
                            controller: _phoneNoController,
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
                          InputBox(
                            placeholder: "Confirm Password",
                            controller: _confirmPasswordController,
                            isPass: true,
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Color(0xFFD39B40),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  }),
                              const Text(
                                  "I accept Terms & Condition and\nPrivacy Policy"),
                              SizedBox(
                                height: screenSize.height * 0.01,
                              )
                            ],
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: PrimaryButton(
                                text: "SIGN UP",
                                onPressed: () async {
                                  register();
                                },
                              )),
                          TextButton(
                            onPressed: () => context.go("/sign-in"),
                            child: const Text(
                              "Already have an account? SignIn",
                              style: TextStyle(color: Colors.black54),
                            ),
                          )
                        ],
                      ),
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
