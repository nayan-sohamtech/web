import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/login_controller.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPassword extends GetView<LoginController> {
  const NewPassword({Key? key}) : super(key: key);

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
                      "New Password ",
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.newPassController,
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
                  onChanged: (value) {
                    controller.newPassword = value;
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
                  height: 20,
                ),
                TextFormField(
                  controller: controller.confirmPassController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    labelStyle:
                        GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    hintText: "Abcd@1234",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    controller.confiemPassword = value;
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
                    if (value != controller.newPassword) {
                      Get.snackbar("Confirm Password", "Password do not match",
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      Get.snackbar("Confirm Password", "Passwords match",
                          backgroundColor: Colors.green,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
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
                        print(controller.loginFormKey.currentState!.validate());
                        Get.offAllNamed(authenticationPageRoute);
                      }
                    },
                    child: const Text(
                      "Update Password ",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
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
