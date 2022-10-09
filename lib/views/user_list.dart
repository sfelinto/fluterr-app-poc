import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {

    const users = {...DUMMY_USERS};
    // ignore: constant_identifier_names
    const TITLE = 'LISTA DE USUARIOS';

    return Scaffold(

      appBar: AppBar(
          title: const Text(TITLE)
        ) ,
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) => UserTile(users.values.elementAt(i)),
      ),
    );
  }
}