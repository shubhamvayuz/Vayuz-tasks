import 'package:apism/CrudWithModel/models/user.dart';
import 'package:apism/Utils/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class ViewUser extends StatefulWidget {
  final User user;

  const ViewUser({Key? key, required this.user}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text("SQLite CRUD",style:  TextStyle(color:AppColors.appMainColor)),
      ),
        body: Container(
          padding:const  EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Center(
                child:  Text(
                  "Full Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.appMainColor,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Name',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(widget.user.name ?? '', style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Contact',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(widget.user.contact ?? '', style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Description',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.user.description ?? '', style: const TextStyle(fontSize: 16)),
                ],
              )
            ],
          ),
        ));
  }
}