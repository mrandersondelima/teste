import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hora_do_foco/controllers/login_screen_controller.dart';
import 'package:hora_do_foco/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginScreenController loginScreenController = Get.find<LoginScreenController>();

    return Scaffold(      
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                          child: Image.asset('assets/images/logo.png')),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 70,
                        child: TextField(            
                                        
                          onChanged: (value) {
                            loginScreenController.email.value = value;
                          },
                          style:
                              const TextStyle(fontSize: 20.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'E-mail',
                            hintStyle:
                                const TextStyle(fontSize: 20.0, color: Color(0xFFbdc6cf)),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 70,
                        child: TextField(
                          style: const TextStyle(fontSize: 20.0, color: Colors.black),
                          obscureText: true,
                          onChanged: (value) =>
                              loginScreenController.password.value = value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Senha',
                            hintStyle:
                                const TextStyle(fontSize: 20.0, color: Color(0xFFbdc6cf)),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Esqueci minha senha',
                            style: TextStyle(color: Colors.red)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                disabledBackgroundColor: Colors.red.withAlpha(100)),
                            onPressed: loginScreenController.signinFunction,
                            child: const Text(
                              'ENTRAR',
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não tem cadastro?',
                        style: TextStyle(color: Colors.red),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: const BorderSide(width: 1, color: Colors.red),
                          ),
                        ),
                        onPressed: (){ Get.to(()=> SignupScreen()); },
                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
