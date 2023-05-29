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
        columnWidths: {0: FixedColumnWidth(250)},
        children: [
          TableRow(
            children: [
              const _AvatarContainer(),
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

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () {},
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
            const Text(
              'Nombre de usuario',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
