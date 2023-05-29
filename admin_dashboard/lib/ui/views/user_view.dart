import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class UserView extends StatefulWidget {
  final String uid;
  const UserView({super.key, required this.uid});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;
  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDB) {
      userFormProvider.user = userDB;
      setState(() => user = userDB);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'UserView',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        if (user == null)
          WhiteCard(
            title: " ",
            child: Container(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        else
          const _UserViewBody()
        // WhiteCard(
        //   title: 'User View',
        //   child: Text('UID: ${widget.uid}'),
        // ),
      ],
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(250),
        },
        children: const [
          TableRow(
            children: [
              _AvatarContainer(),
              _UserViewForm(),
            ],
          ),
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    final user = userFormProvider.user;
    return WhiteCard(
      title: 'Informacion General',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: user!.nombre,
              decoration: CustomInputs.formInputDecoration(
                hint: 'Nombre del Usuario',
                label: 'Nombre',
                icon: Icons.supervised_user_circle_outlined,
              ),
              onChanged: (value) =>
                  userFormProvider.copyUserWith(nombre: value),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Ingrese un nombre';
                if (value.length < 2) {
                  return 'El nombre debe  de ser de dos letras como minimo';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: user.correo,
              decoration: CustomInputs.formInputDecoration(
                hint: 'Correo del Usuario',
                label: 'Correo',
                icon: Icons.mark_email_read_outlined,
              ),
              onChanged: (value) =>
                  userFormProvider.copyUserWith(correo: value),
              validator: (value) {
                if (!EmailValidator.validate(value ?? '')) {
                  return 'Email no valido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final saved = await userFormProvider.updateUser();
                      if (saved) {
                        NotificationService.showSnackbar('Usuario Actualizado');
                        Provider.of<UsersProvider>(context, listen: false)
                            .refreshUser(user);
                      } else {
                        NotificationService.showSnackbarError(
                            'No se pudo guardar');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.save_outlined,
                          size: 20,
                        ),
                        Text('  Guardar'),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;
    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2),
            const SizedBox(height: 20),
            Container(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage('no-image.jpg'),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: FloatingActionButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                          );

                          if (result != null) {
                            NotificationService.showBusyIndicator(context);
                            final res = await userFormProvider.uploadImage(
                              '/uploads/usuarios/${user!.uid}',
                              result.files.first.bytes!,
                            );
                            Navigator.of(context).pop();
                          } else {
                            // User canceled the picker
                          }
                        },
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user!.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
