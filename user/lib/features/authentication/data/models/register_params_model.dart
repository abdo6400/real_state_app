import 'package:image_picker/image_picker.dart';

class RegisterParamsModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final XFile? image;
  RegisterParamsModel(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      this.image});
}
