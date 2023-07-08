import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

Widget textInput(
  TextEditingController controller,
  String label,
  String validatorText,
) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: label,
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) => value!.isEmpty ? validatorText : null,
  );
}

Widget emailInput(TextEditingController emailController) {
  return TextFormField(
    controller: emailController,
    cursorColor: Colors.black,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.email)),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (email) => email != null && !EmailValidator.validate(email)
        ? 'Enter your email'
        : null,
  );
}

Widget passwordInput(TextEditingController passwordController, bool obsecure,
    void Function(bool) updateObsecure) {
  return Stack(
    children: [
      TextFormField(
        controller: passwordController,
        cursorColor: Colors.black,
        textInputAction: TextInputAction.done,
        obscureText: obsecure,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: "Password",
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => value != null && value.length < 6
            ? 'Enter minimum of 6 character'
            : null,
      ),
      Positioned(
        right: 0,
        child: IconButton(
          icon: obsecure
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () {
            updateObsecure(obsecure);
          },
        ),
      )
    ],
  );
}

Widget searchBox(TextEditingController text) {
  return TextField(
    controller: text,
    decoration: InputDecoration(
      hintText: "Search...",
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey.shade600,
        size: 20,
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.shade100)),
    ),
  );
}
