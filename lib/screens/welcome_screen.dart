import 'package:car_wash/components/car_background.dart';
import 'package:car_wash/components/primary_button.dart';
import 'package:car_wash/components/secondary_button.dart';
import 'package:car_wash/screens/sign_in_screen.dart';
import 'package:car_wash/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CarBackground(
        imagePath: "images/background.jpg",
        child: SingleChildScrollView(
          reverse: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenSize.height * 0.05),
                  child: SizedBox(
                      height: 220,
                      width: 220,
                      child: Image.asset("images/logo.png")),
                ),
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            text: "Login to MG Washers",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()),
                              );
                            },
                          )),
                      SizedBox(
                        width: double.infinity,
                        child: SecondaryButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
                          text: "Create New Account",
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenSize.height * 0.05),
                  child: const Column(
                    children: [
                      Text(
                        "By continuing you agree to our",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Terms of service.Privacy Policy.Content Policy",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
