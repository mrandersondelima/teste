import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hora_do_foco/screens/home_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class SignupScreenController extends GetxController {
  Rx<String?> email = ''.obs, password1 = ''.obs, password2 = ''.obs, name = ''.obs;

  bool get isValidEmail {
    if (email.value == null) {
      return false;
    } else {
      return GetUtils.isEmail(email.value!);
    }
  }

  bool get isPasswordValid {
    if (password1.value == null) {
      return false;
    } else {
      return password1.value!.isNotEmpty;
    }
  }

  String? get password2ErrorMessage {
    return isPassword2Valid ? null : 'As senhas não conferem';
  }

  bool get isPassword2Valid {
    return password2.value == password1.value;
  }

  String? get emailErrorMessage {
    return isValidEmail ? null : 'O e-mail é inválido';
  }

  String? get passwordErrorMessage {
    return isPasswordValid ? null : 'A senha é obrigatória';
  }

  bool get isFormValid {
    if (isPasswordValid && isValidEmail && isPassword2Valid) {
      return true;
    }
    return false;
  }

  VoidCallback? get signupFunction {
    return () async {
      if (!isFormValid) {
        Get.snackbar(
          "Erro",
          "E-mail ou senha inválidos",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
          messageText: const Text('O formulário contém erros'),
        );
      } else {
        final user = ParseUser.createUser(email.value, password1.value, null);

        user.set('name', name.value );

        final response = await user.signUp(allowWithoutEmail: true);        

        if (response.success) {
          Get.snackbar(
            "Sucesso",
            "Usuário criado",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            messageText: const Text("Usuário criado"),
          );
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
    };
  }
}
