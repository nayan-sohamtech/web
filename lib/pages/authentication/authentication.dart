import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/login_controller.dart';
import 'package:flutter_web_dashboard/pages/forget_password/forget_password.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends GetView<LoginController> {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "Welcome back to the admin panel.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle:
                        GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    hintText: "abc@domain.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Please enter valid Email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle:
                        GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    hintText: "Abcd@1234",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be Empty";
                    }

                    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
                      return "Please enter one character in Uppercase.";
                    }
                    if (!RegExp(r'(?=.*?[a-z])').hasMatch(value)) {
                      return "Please enter one character in Lowercase.";
                    }
                    if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(value)) {
                      return "Please enter one Special character.";
                    }
                    if (!RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
                      return "Please enter Numeric character.";
                    }
                    if (!RegExp(r'.{8,}$').hasMatch(value)) {
                      return "Password length should be atleast 8";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        const Text(
                          "Remeber Me",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Get.to(ForgetPassword());
                      },
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.poppins(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: double.maxFinite),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(active),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                    onPressed: () {
                      if (controller.loginFormKey.currentState!.validate()) {
                        Get.offAllNamed(rootRoute);
                      } else {
                        Get.snackbar("Login", "valid credentials",
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     Get.offAllNamed(rootRoute);
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: active,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     alignment: Alignment.center,
                //     width: double.maxFinite,
                //     padding: const EdgeInsets.symmetric(vertical: 16),
                //     child: const Text(
                //       "Login",
                //       style: TextStyle(
                //         fontSize: 20,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                // Row(
                //   children: [
                //     Text(
                //       "Do not have admin credentials?",
                //       style: TextStyle(color: Colors.white, fontSize: 13),
                //     ),
                //     Spacer(),
                //     Text(
                //       "Request Credentials! ",
                //       style: TextStyle(color: primaryColor, fontSize: 13),
                //     ),
                //   ],
                // ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Do not have admin credentials?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Request Credentials! ",
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
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
