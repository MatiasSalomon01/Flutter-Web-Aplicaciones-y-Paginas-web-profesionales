import 'package:admin_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validForm() {
    return formKey.currentState!.validate();
  }
}
