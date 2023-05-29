import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    usersProvider
        .getUserById(widget.uid)
        .then((userDB) => setState(() => user = userDB));
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
          ),
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
        columnWidths: {0: FixedColumnWidth(250)},
        children: [
          TableRow(
            children: [
              Container(
                color: Colors.red,
                width: 250,
                height: 200,
              ),
              Container(
                color: Colors.green,
                height: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
