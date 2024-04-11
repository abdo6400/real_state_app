import 'package:google_sign_in/google_sign_in.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/auth_model.dart';
import '../models/register_params_model.dart';

abstract class RegisterRemoteDataSource {
  Future<AuthModel> register(RegisterParamsModel registerParamsModel);
  Future<AuthModel> registerWithGoogle();
  Future<AuthModel> checkEmail(String email);
  Future<AuthModel> verifyEmail(String code, String secureKey);
  Future<AuthModel> resendCode(String email);
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final ApiConsumer _apiConsumer;

  RegisterRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<AuthModel> checkEmail(String email) async {
    final response = await _apiConsumer
        .post(EndPoints.checkEmail, body: {ApiKeys.email: email});
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> register(RegisterParamsModel registerParamsModel) async {
    final Map<String, dynamic> body = {
      'name': registerParamsModel.name,
      'phone': registerParamsModel.phone,
      'email': registerParamsModel.email,
      'password': registerParamsModel.password,
      "logo": registerParamsModel.image == null
          ? null
          : await multipartConvertImage(image: registerParamsModel.image!),
    "signWithGoogle": false
    };

    final response = await _apiConsumer.post(EndPoints.register, body: body);
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> registerWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ["email"],
    );
    GoogleSignInAccount? account = await googleSignIn.signIn();

    if (account == null) {
      throw throw const NotFoundException(AppStrings.someThingWentWrong);
    }
    final Map<String, dynamic> body = {
      'name': account.displayName,
      'phone': "0",
      'email': account.email,
      'password': account.id,
      "signWithGoogle": true
    };

    final response = await _apiConsumer.post(EndPoints.register, body: body);
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> resendCode(String email) async {
    final response = await _apiConsumer
        .post(EndPoints.resendCode, body: {ApiKeys.email: email});
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> verifyEmail(String code, String secureKey) async {
    final response = await _apiConsumer.post(EndPoints.verifyEmail,
        body: {ApiKeys.otpSecret: secureKey, ApiKeys.token: code});
    return AuthModel.fromJson(response);
  }
}
