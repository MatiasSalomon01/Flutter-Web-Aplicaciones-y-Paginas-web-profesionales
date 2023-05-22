import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.supervised_user_circle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El Nombre es obligatorio';
                          }
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.name = value,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no valido';
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: '**********',
                          label: 'Contraseña',
                          icon: Icons.lock_outline,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          if (value.length < 6) {
                            return 'Contraseña debe de ser de 6 caracteres';
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            registerFormProvider.password = value,
                      ),
                      const SizedBox(height: 20),
                      CustomOutlinedButton(
                          onPressed: () => registerFormProvider.validateForm(),
                          text: 'Crear Cuenta'),
                      const SizedBox(height: 20),
                      LinkText(
                        text: 'Ir al Login',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
