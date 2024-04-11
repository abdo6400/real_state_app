abstract class User {
  final String message;
  final UserClass user;

  User({
    required this.message,
    required this.user,
  });
}

abstract class UserClass {
  final String name;
  final String phone;
  final String email;
   final String? logo;
  final bool signWithGoogle;

  UserClass({
    required this.name,
    required this.phone,
    required this.email,
    required this.signWithGoogle,
    required this.logo
  });
}
