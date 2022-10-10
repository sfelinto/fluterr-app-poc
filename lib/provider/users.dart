import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(User usr){
    // ignore: unnecessary_null_comparison
    if (usr == null) {
      return;
    }
    
    //edit
    // ignore: unnecessary_null_comparison
    if (usr.id != null && 
          usr.id.trim().isNotEmpty && 
            _items.containsKey(usr.id)) {
      _items.update(usr.id, (_) => usr);
    } else {
        //add user
        final id = Random().nextDouble().toString();
        _items.putIfAbsent(id, () => User (
            id: id,
            name: usr.name,
            email: usr.email,
            avatarUrl: usr.avatarUrl,
          ));
    }

    

      notifyListeners();
  }
}