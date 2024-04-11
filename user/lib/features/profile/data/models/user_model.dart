import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.message,
    required super.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: UserClassModel.fromJson(json["results"]["user"]),
      );
}

class UserClassModel extends UserClass {
  UserClassModel(
      {required super.name,
      required super.phone,
      required super.email,
        required super.logo,
      required super.signWithGoogle});

  factory UserClassModel.fromJson(Map<String, dynamic> json) => UserClassModel(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
          logo: json["logo"],
        signWithGoogle: json["signWithGoogle"],
      );
}
