import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => CategoryModal(categoria: category),
                );
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
                      onPressed: () async {
                        await Provider.of<CategoriesProvider>(context,
                                listen: false)
                            .deleteCategory(category.id);

                        Navigator.of(context).pop();
                      },
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
