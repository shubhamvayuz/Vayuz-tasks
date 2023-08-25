import 'package:apism/CrudWithModel/models/user.dart';
import 'package:apism/CrudWithModel/screens/add_user.dart';
import 'package:apism/CrudWithModel/screens/edit_user.dart';
import 'package:apism/CrudWithModel/screens/view_user.dart';
import 'package:apism/CrudWithModel/services/user_service.dart';
import 'package:apism/Utils/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class CrudHomeScreen extends StatefulWidget {
  const CrudHomeScreen({Key? key}) : super(key: key);

  @override
  State<CrudHomeScreen> createState() => _CrudHomeScreenState();
}

class _CrudHomeScreenState extends State<CrudHomeScreen> {
  late List<User> _userList = <User>[];
  final _userService = UserService();
  // bool isList = true;

  getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    _userList = <User>[];
    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.name = user['name'];
        userModel.contact = user['contact'];
        userModel.description = user['description'];
        _userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Are You Sure to Delete',
              style: TextStyle(color: AppColors.appMainColor, fontSize: 20),
              
            ),
            actions: [
              
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // foreground
                      backgroundColor: Colors.teal.shade100),
                  onPressed: ()  async{
                     var result=await _userService.deleteUser(userId);
                     if (result != null) {
                       // ignore: use_build_context_synchronously
                       Navigator.pop(context);
                       getAllUserDetails();
                       _showSuccessSnackBar(
                           'User Detail Deleted Success');
                     }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // foreground
                      backgroundColor: AppColors.appMainColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("SQLite CRUD",style: TextStyle(color: AppColors.appMainColor)),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          return Container(
            padding:const EdgeInsets.symmetric(horizontal: 7),
            margin: const EdgeInsets.symmetric(horizontal:12,vertical:8),
            decoration: const BoxDecoration(
              color: AppColors.appMainColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              tileColor: AppColors.appMainColor,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewUser(
                              user: _userList[index],
                            )));
              },
              leading: const Icon(Icons.person,color: Colors.white,),
              title: Text(_userList[index].name ?? '',style: const TextStyle(color: Colors.white)),
              subtitle: Text(_userList[index].contact ?? '',style: const TextStyle(color: Colors.white)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditUser(
                                      user: _userList[index],
                                    ))).then((data) {
                          if (data != null) {
                            getAllUserDetails();
                            _showSuccessSnackBar(
                                'User Detail Updated Success');
                          }
                        });
                        
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        _deleteFormDialog(context, _userList[index].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          );
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddUser()))
              .then((data) {
            if (data != null) {
              getAllUserDetails();
              _showSuccessSnackBar('User Detail Added Success');
            }
          });
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add,color:AppColors.appMainColor),
      ),
    );
  }
}