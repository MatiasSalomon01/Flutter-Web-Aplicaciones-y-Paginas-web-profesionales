import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;
  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow getRow(int index) {
    final category = categorias[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(category.id)),
        DataCell(Text(category.nombre)),
        DataCell(Text(category.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                NotificationService.showSnackbarError('Editando: $category');
              },
              icon: const Icon(Icons.edit_outlined),
            ),
            IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  title: const Text('Estas seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${category.nombre}?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Si, Borrar'),
                    ),
                  ],
                );

                showDialog(
                  context: context,
                  builder: (context) => dialog,
                );
              },
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red.withOpacity(0.8),
              ),
            )
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
