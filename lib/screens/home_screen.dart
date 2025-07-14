import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hora_do_foco/controllers/login_screen_controller.dart';
import 'package:hora_do_foco/screens/login_screen.dart';
import 'package:hora_do_foco/screens/new_task.dart';
import 'package:hora_do_foco/widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({title, super.key});

  @override
  Widget build(BuildContext context) {
    final LoginScreenController loginScreenController =
        Get.find<LoginScreenController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hora do Foco',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 5.0,
          foregroundColor: Theme.of(context).textTheme.bodyLarge!.color,
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            if (!loginScreenController.isLoggedIn) {
              Get.to(() => const LoginScreen());
            } else {
              _exibeModal();
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            fixedSize: const Size(60, 60),
            elevation: 5.0,
          ),
          child: const Text('+', style: TextStyle(fontSize: 30)),
        ),
        // drawer: Drawer(
        //   backgroundColor: Colors.white,
        //   surfaceTintColor: Colors.white,
        //   child: Text(
        //     'Drawer content here',
        //     style: TextStyle(
        //       color: Theme.of(context).textTheme.bodyLarge!.color,
        //     ),
        //   ),
        // ),
        drawer: MyDrawer(loginScreenController: loginScreenController),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   fixedColor: Theme.of(context).textTheme.bodyLarge!.color,
        //   items: const [
        //      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //      BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lista'),
        //      BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Outra lista'),
        //   ],),
      ),
    );
  }

  void _exibeModal() {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: Get.context!,
      backgroundColor: const Color(0xFF101010),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      useSafeArea: true,
      builder: (context) {
        return NewTask();
      },
    );
  }
}
