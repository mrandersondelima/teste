import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:hora_do_foco/controllers/signup_screen_controller.dart';
import 'package:hora_do_foco/screens/login_screen.dart';

const borderGrey = BorderSide(color: Colors.grey);
const borderRed = BorderSide(color: Colors.red);

class SignupScreen extends StatelessWidget {
  final SignupScreenController signupScreenController =
      SignupScreenController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 150,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 70,
                    child: TextField(
                      onChanged: (value) {
                        signupScreenController.name.value = value;
                      },
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      decoration: fieldDecoration('Nome', null),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 70,
                    child: TextField(
                      onChanged: (value) {
                        signupScreenController.email.value = value;
                      },
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      decoration: fieldDecoration('E-mail', null),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 70,
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        signupScreenController.password1.value = value;
                      },
                      decoration: fieldDecoration('Senha', null),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 70,
                    child: Obx(
                      () => TextField(
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          signupScreenController.password2.value = value;
                        },
                        decoration: fieldDecoration(
                          "Confirmar senha",
                          signupScreenController.password2ErrorMessage,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        disabledBackgroundColor: Colors.red.withAlpha(100),
                      ),
                      onPressed: signupScreenController.signupFunction,
                      child: const Text(
                        'CRIAR USUÁRIO',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text(
                      'Voltar para o login',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const Row(),
          ],
        ),
      ),
    );
  }
}

InputDecoration fieldDecoration(String hintText, String? errorText) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    errorText: errorText,
    hintStyle: const TextStyle(fontSize: 20.0, color: Color(0xFFbdc6cf)),
    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
    focusedBorder: OutlineInputBorder(
      borderSide: borderGrey,
      borderRadius: BorderRadius.circular(25.7),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: borderGrey,
      borderRadius: BorderRadius.circular(25.7),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: borderRed,
      borderRadius: BorderRadius.circular(25.7),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: borderRed,
      borderRadius: BorderRadius.circular(25.7),
    ),
  );
}
