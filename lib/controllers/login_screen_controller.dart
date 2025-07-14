import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hora_do_foco/controllers/user_controller.dart';
import 'package:hora_do_foco/model/user.dart';
import 'package:hora_do_foco/screens/home_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class LoginScreenController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var _isLoggedIn = false.obs;

  bool get isValidEmail {
    return GetUtils.isEmail(email.value) && email.value.isNotEmpty;
  }

  bool get isLoggedIn {
    return _isLoggedIn.value;
  }

  set isLoggedIn(value) {
    _isLoggedIn.value = value;
  }

  bool get isPasswordValid {
    return password.value.isNotEmpty;
  }

  String? get emailErrorMessage {
    return isValidEmail ? null : 'O e-mail é inválido';
  }

  String? get passwordErrorMessage {
    return isPasswordValid ? null : 'A senha é obrigatória';
  }

  bool get isFormValid {
    if (isPasswordValid && isValidEmail) {
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();

    if (response.success) {
      _isLoggedIn.value = false;
      email = ''.obs;
      password = ''.obs;
      Get.snackbar("Até mais", "Até mais");
    } else {
      Get.snackbar(
        "Erro",
        "E-mail ou senha inválidos",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        messageText: Text(response.error!.message),
      );
    }
  }

  Future<void> signinFunction() async {
      if (!isFormValid) {
        Get.snackbar(
          "Erro",
          "E-mail ou senha inválidos",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
          messageText: const Text('Usuário ou senha inválidos'),
        );
      } else {
        final user = ParseUser.createUser(email.value, password.value, null);

        final response = await user.login();

        if (response.success) {
          _isLoggedIn.value = true;          
                    
          ParseUser parseUser = response.result;
          Get.find<UserController>().user = User.fromParse(parseUser).obs;

          Get.to(() => const HomeScreen());
        } else {
          Get.snackbar(
            "Erro",
            response.error!.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            messageText: Text(response.error!.message),
          );
        }
      }
  }
}
