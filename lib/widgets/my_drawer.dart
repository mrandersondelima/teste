import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hora_do_foco/controllers/login_screen_controller.dart';
import 'package:hora_do_foco/controllers/user_controller.dart';
import 'package:hora_do_foco/screens/login_screen.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key, required this.loginScreenController});

  final LoginScreenController loginScreenController;
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            color: Colors.grey.shade200,
            child: Obx(
              () => Row(
                children: [
                  () {
                    if (loginScreenController.isLoggedIn) {
                      return Text(
                        "Olá, ${userController.user!.value.name}!",
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Olá, visitante.",
                            style: TextStyle(color: Colors.red, fontSize: 25),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(() => const LoginScreen());
                              },
                              child: const Text(
                                'Faça seu login!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }(),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(() {
                if (loginScreenController.isLoggedIn) {
                  return IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: loginScreenController.logout,
                    color: Colors.red,
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}
