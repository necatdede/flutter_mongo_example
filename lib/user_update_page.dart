import 'package:flutter/material.dart';
import 'package:flutter_mongo_example/db_helper/mongodb.dart';
import 'package:flutter_mongo_example/user_model.dart';

class UserUpdatePage extends StatefulWidget {
  const UserUpdatePage({Key? key}) : super(key: key);

  @override
  State<UserUpdatePage> createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    name.text = user.name;
    password.text = user.password;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: name,
          ),
          TextField(
            controller: password,
          ),
          ElevatedButton(
              onPressed: () async {
                final data = UserModel(
                    id: user.id, name: name.text, password: password.text);
                await MongoDatabase.update(data)
                    .then((value) => Navigator.pop(context));
              },
              child: const Text("update"))
        ],
      )),
    );
  }
}