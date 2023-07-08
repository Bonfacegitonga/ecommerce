import 'package:ecommerce/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/wigdet.dart';

class SignInScreen extends StatefulWidget {
  // final VoidCallback onClickedSignUp;
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                "Welcome Back",
                style: GoogleFonts.inder(
                    color: Colors.black87,
                    fontSize: 26,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Sign in with your email and password",
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Form(
                child: Column(
                  children: [
                    emailInput(emailController),
                    const SizedBox(height: 20),
                    passwordInput(passwordController, _obscureText,
                        (bool value) {
                      setState(() {
                        _obscureText = !value;
                      });
                    }),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password? ",
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "No account? ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                              },
                              child: const Text('Sign Up',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.orange)),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 2),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orange)),
                        onPressed: () {},
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
