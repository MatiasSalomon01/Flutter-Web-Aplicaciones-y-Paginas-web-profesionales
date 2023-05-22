import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      // print('$email === $password');
      return true;
    } else {
      // print('Form not valid');
      return false;
    }
  }
}
