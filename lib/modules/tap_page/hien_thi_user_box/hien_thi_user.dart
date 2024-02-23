import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/model/hive/box/boxes.dart';
import 'package:stock_app/model/provider/app_provider.dart';

import '../../../model/hive/model/user_model.dart';

class HienThiUser extends StatefulWidget {
  const HienThiUser({super.key});

  @override
  State<HienThiUser> createState() => _HienThiUserState();
}

class _HienThiUserState extends State<HienThiUser> {
  late AppChungKhoanProvider appProvider;
  @override
  void initState() {
    appProvider = context.read<AppChungKhoanProvider>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Hien Thi User trong box",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Selector<AppChungKhoanProvider, List>(
            selector: (_, p) => p.getUserBox(),
            shouldRebuild: (previous, next) => true,
            builder: (context, users, child) {
              return Expanded(
                  child: ListView.builder(
                itemCount: userBox.length,
                itemBuilder: (BuildContext context, int index) {
                  User user = users[index];
                  return ListTile(
                    leading: IconButton(
                        onPressed: () {
                          appProvider.deleteUserBox(index);
                          // setState(() {
                          //   boxPerson.deleteAt(index);
                          // });
                        },
                        icon: const Icon(Icons.remove)),
                    title: Text('name: ${user.name}'),
                    subtitle: Text('email: ${user.email}'),
                    trailing: Text('password: ${user.password}'),
                  );
                },
              ));
            },
          )
        ],
      ),
    );
  }
}
