import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../user/domain/entity/user_entity.dart';
import '../../../../user/presentation/viewmodel/user_view_model.dart';
import 'profile_edit_page_view.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var userState = ref.read(userViewModelProvider);
    List<UserEntity>? userList = userState.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/city1.jpg'),
            ),
            const SizedBox(height: 16.0),
            if (userList != null && userList.isNotEmpty)
              Text(
                userList[0].fullname,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              const Text(
                'No user data available',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 16.0),
            if (userList != null && userList.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(
                  userList[0].email,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 15, 15, 15),
                  ),
                ),
              )
            else
              const Text(''),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditPageView(),
                  ),
                );
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
