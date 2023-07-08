import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/wigdet.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  //final Function() onClickedSignIn;
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();

  bool _obscureText = true;
  updateCheck(bool value) {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: kPrimaryColor,),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              Text(
                "WELCOME",
                style: GoogleFonts.inder(
                    fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Create New Account",
                      style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                ],
              ),
              const SizedBox(height: 15),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: textInput(firstNameController, "First Name",
                                "Enter your first name")),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: textInput(lastNameController, "Last Name",
                              "Enter your last name"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    textInput(
                      userNameController,
                      'Username',
                      "Enter your usename",
                    ),
                    const SizedBox(height: 20),
                    emailInput(emailController),
                    const SizedBox(height: 20),
                    passwordInput(passwordController, _obscureText,
                        (bool value) {
                      setState(() {
                        _obscureText = !value;
                      });
                    }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInScreen()));
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange)),
                            onPressed: () {
                              final isValid = formKey.currentState!.validate();
                              if (!isValid) return;
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
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
