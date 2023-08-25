
import 'package:apism/CrudWithModel/models/user.dart';
import 'package:apism/CrudWithModel/services/user_service.dart';
import 'package:apism/Utils/widgets/app_colors.dart';
import 'package:apism/Utils/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';
class EditUser extends StatefulWidget {
  final User user;
  const EditUser({Key? key,required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _userNameController = TextEditingController();
  final _userContactController = TextEditingController();
  final _userDescriptionController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  final _userService=UserService();

  @override
  void initState() {
    setState(() {
      _userNameController.text=widget.user.name??'';
      _userContactController.text=widget.user.contact??'';
      _userDescriptionController.text=widget.user.description??'';
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SQLite CRUD",style:  TextStyle(color:AppColors.appMainColor)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child:  Text(
                  'Edit New User',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              MyTextFieldWidgets(hintText:  'Enter Name', labelText: 'Name', controller: _userNameController, validate: _validateName),
              const SizedBox(height: 20.0,),
              MyTextFieldWidgets(hintText: 'Enter Contact', labelText:  'Contact', controller: _userContactController, validate: _validateContact),
              const SizedBox(height: 20.0,),
              MyTextFieldWidgets(hintText: 'Enter Description', labelText:  'Description', controller: _userDescriptionController, validate: _validateDescription),
              const SizedBox(height: 20.0,),
             
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _userContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _userDescriptionController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;

                        });
                        if (_validateName == false &&
                            _validateContact == false &&
                            _validateDescription == false) {
                          // print("Good Data Can Save");
                          var data = User();
                          data.id=widget.user.id;
                          data.name = _userNameController.text;
                          data.contact = _userContactController.text;
                          data.description = _userDescriptionController.text;
                          var result=await _userService.updateUser(data);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context,result);
                        }
                      },
                      child: const Text('Update Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal.shade200,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _userNameController.text = '';
                        _userContactController.text = '';
                        _userDescriptionController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
