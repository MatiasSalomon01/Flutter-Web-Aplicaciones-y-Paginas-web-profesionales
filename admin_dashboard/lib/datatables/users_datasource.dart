import 'package:admin_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  final List<Usuario> users;
  UsersDTS(this.users);

  @override
  DataRow? getRow(int index) {
    final user = users[index];
    final image = Image(
      image: AssetImage('no-image.jpg'),
      width: 35,
      height: 35,
    );
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(ClipOval(
          child: image,
        )),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_outlined,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
