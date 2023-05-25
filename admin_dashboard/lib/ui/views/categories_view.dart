import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'CategoriesView',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        PaginatedDataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Categoria')),
            DataColumn(label: Text('Creado por')),
            DataColumn(label: Text('Acciones')),
          ],
          source: CategoriesDTS(),
        ),
      ],
    );
  }
}
