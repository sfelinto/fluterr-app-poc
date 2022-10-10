import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/users.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {

    //const users = {...DUMMY_USERS};
    final Users users = Provider.of(context, listen: true);

    // ignore: constant_identifier_names
    const TITLE = 'LISTA DE USUARIOS';

    return Scaffold(

      appBar: AppBar(
          title: const Text(TITLE),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add), 
              onPressed: () {
                // users.put(const User(
                //   name: 'test',
                //   email: 's@s.com',
                //   avatarUrl: ''
                // ));
              },
              ),
          ],
        ) ,
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}