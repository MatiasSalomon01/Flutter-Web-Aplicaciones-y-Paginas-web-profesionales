import 'package:admin_dashboard/models/http/category.dart';
import 'package:flutter/material.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;
  const CategoryModal({super.key, this.categoria});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = "";
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: buildBoxDecoration(),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Color(0xff0f2041),
        boxShadow: [
          BoxShadow(color: Colors.black26),
        ],
      );
}
