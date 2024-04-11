import 'package:google_sign_in/google_sign_in.dart';
import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/auth_model.dart';

abstract class LoginRemoteDataSource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> loginWithGoogle();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiConsumer _apiConsumer;

  LoginRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<AuthModel> login(String email, String password) async {
    final response = await _apiConsumer.post(EndPoints.login,
        body: {ApiKeys.email: email, ApiKeys.password: password});

    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> loginWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ["email"],
    );
    GoogleSignInAccount? account = await googleSignIn.signIn();

    if (account == null) {
      throw throw const NotFoundException(AppStrings.someThingWentWrong);
    }
    final response = await _apiConsumer.post(EndPoints.login,
        body: {ApiKeys.email: account.email, ApiKeys.password: account.id});
    return AuthModel.fromJson(response);
  }
}
