import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/user/domain/entity/user_entity.dart';
import 'package:trip_planner/features/user/presentation/viewmodel/user_view_model.dart';

class EditPageView extends ConsumerStatefulWidget {
  const EditPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditPageViewState();
}

class _EditPageViewState extends ConsumerState<EditPageView> {
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var userState = ref.read(userViewModelProvider);
    List<UserEntity>? userList = userState.users;

    if (userList != null && userList.isNotEmpty) {
      _fullnameController.text = userList[0].fullname ?? '';
      _emailController.text = userList[0].email ?? '';
      _usernameController.text = userList[0].username ?? '';
      _passwordController.text = userList[0].password ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(userViewModelProvider);
    List<UserEntity>? userList = userState.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _fullnameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'username',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                UserEntity user = UserEntity(
                  fullname: _fullnameController.text.trim(),
                  email: _emailController.text.trim(),
                  username: _usernameController.text.trim(),
                  password: _passwordController.text.trim(),
                );

                await ref
                    .read(userViewModelProvider.notifier)
                    .updateUserById(user);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
