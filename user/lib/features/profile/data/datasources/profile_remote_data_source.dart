import 'package:user/config/database/api/end_points.dart';

import '../../../../config/database/api/api_consumer.dart';
import '../models/user_model.dart';

abstract class ProfileDataSource {
  Future<UserModel> getUser();
  Future<String> deleteUser();
  Future<UserModel> editUser(String phone, String name);
  Future<String> changePassword(
      String oldPassword, String newPassword, String confirmPassword);
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final ApiConsumer _apiConsumer;

  ProfileDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<UserModel> getUser() async {
    final response = await _apiConsumer.get(EndPoints.user);

    return UserModel.fromJson(response);
  }

  @override
  Future<String> changePassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    final response = await _apiConsumer.post(EndPoints.changePassword, body: {
      ApiKeys.oldPassword: oldPassword,
      ApiKeys.newPassword: newPassword,
      ApiKeys.confirmPassword: confirmPassword
    });

    return response["message"];
  }

  @override
  Future<UserModel> editUser(String phone, String name) async {
    final response = await _apiConsumer
        .patch(EndPoints.user, body: {"phone": phone, "name": name});

    return UserModel.fromJson(response);
  }

  @override
  Future<String> deleteUser() async {
    final response = await _apiConsumer.delete(EndPoints.user);

    return response["message"];
  }
}
