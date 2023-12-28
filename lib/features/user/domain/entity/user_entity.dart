import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  // final String fname;
  // final String lname;
  // final String? image;
  // final String phone;
  final String fullname;
  final String email;
  final String username;
  final String password;

  const UserEntity({
    this.id,
    // required this.fname,
    // required this.lname,
    // this.image,
    // required this.phone,
    required this.fullname,
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        id,
        fullname,
        email,
        username,
        password,
      ];
}
