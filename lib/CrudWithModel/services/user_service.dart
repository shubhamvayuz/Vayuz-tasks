

import 'package:apism/CrudWithModel/DB_Helper/repository.dart';
import 'package:apism/CrudWithModel/models/user.dart';

class UserService
{
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
  //Save User
  // ignore: non_constant_identifier_names
  saveUser(User user) async{
    return await _repository.insertData('users', user.userMap());
  }
  //Read All Users
  readAllUsers() async{
    return await _repository.readData('users');
  }
  //Edit User
  updateUser(User user) async{
    return await _repository.updateData('users', user.userMap());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }

}