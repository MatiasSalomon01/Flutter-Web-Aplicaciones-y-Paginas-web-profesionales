import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'UsersView',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        PaginatedDataTable(
          sortAscending: usersProvider.ascending,
          sortColumnIndex: usersProvider.sortColumnIndex,
          columns: [
            const DataColumn(label: Text('Avatar')),
            DataColumn(
                label: const Text('Nombre'),
                onSort: (columnIndex, ascending) {
                  usersProvider.sortColumnIndex = columnIndex;
                  usersProvider.sort((user) => user.nombre);
                }),
            DataColumn(
                label: const Text('Email'),
                onSort: (columnIndex, ascending) {
                  usersProvider.sortColumnIndex = columnIndex;
                  usersProvider.sort((user) => user.correo);
                }),
            const DataColumn(label: Text('UID')),
            const DataColumn(label: Text('Acciones')),
          ],
          source: UsersDTS(usersProvider.users),
          onPageChanged: (value) {},
        ),
      ],
    );
  }
}
