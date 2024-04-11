import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:owner/features/estate_add/data/datasources/estate_remote_data_source.dart';
import 'package:owner/features/estate_add/data/repositories/estate_repository_impl.dart';
import 'package:owner/features/estate_add/domain/repositories/estate_repository.dart';
import 'package:owner/features/estate_add/domain/usecases/add_estate_usecase.dart';
import 'package:owner/features/estate_add/domain/usecases/get_categories_usecase.dart';
import 'package:owner/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:owner/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:owner/features/profile/domain/repositories/profile_repository.dart';
import 'package:owner/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
import '../config/database/api/api_consumer.dart';
import '../config/database/api/app_interceptors.dart';
import '../config/database/api/dio_consumer.dart';
import '../config/database/cache/cache_consumer.dart';
import '../config/database/cache/secure_cache_helper.dart';
import '../config/database/network/netwok_info.dart';
import '../core/components/map/presentation/cubit/map_cubit.dart';
import '../core/utils/google_mpas_tools.dart';
import '../features/authentication/data/datasources/forget_password_renote_data_source.dart';
import '../features/authentication/data/datasources/login_remote_data_source.dart';
import '../features/authentication/data/datasources/register_remote_data_source.dart';
import '../features/authentication/data/repositories/forget_password_repository_impl.dart';
import '../features/authentication/data/repositories/login_repository_impl.dart';
import '../features/authentication/data/repositories/register_repository_impl.dart';
import '../features/authentication/domain/repositories/forget_password_repository.dart';
import '../features/authentication/domain/repositories/login_repository.dart';
import '../features/authentication/domain/repositories/register_repository.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_password_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_resend_code_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_verify_email_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/reset_password_usecase.dart';
import '../features/authentication/domain/usecases/login_usecases/login_usecase.dart';
import '../features/authentication/domain/usecases/login_usecases/login_with_google_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/check_email_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/register_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/register_with_google.dart';
import '../features/authentication/domain/usecases/register_usecases/resend_code_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/verfiy_email_usecase.dart';
import '../features/authentication/presentation/bloc/forget_password/forget_password_bloc.dart';
import '../features/authentication/presentation/bloc/login/login_bloc.dart';
import '../features/authentication/presentation/bloc/register/register_bloc.dart';
import '../features/authentication/presentation/bloc/timer/timer_cubit.dart';
import '../features/estate_add/presentation/bloc/estate_add_bloc.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';
import '/core/bloc/global_cubit/locale_cubit.dart';
import '/core/bloc/global_cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  await _authInit();
  await _app();
  //External
  final sharedPreferences = await SecureSharedPref.getInstance();
  sl.registerLazySingleton<CacheConsumer>(
      () => SecureCacheHelper(sharedPref: sharedPreferences));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit());
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  sl.registerLazySingleton<MapCubit>(() => MapCubit());
  sl.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: sl(), networkInfo: sl()));
  sl.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  sl.registerLazySingleton(() => AppIntercepters(
        client: sl(),
      ));
  //google maps tools
  sl.registerLazySingleton(() => GoogleMapsTools());
}

Future<void> _authInit() async {
  //! Blocs or cubits
  sl.registerLazySingleton(() => LoginBloc(sl()));
  sl.registerLazySingleton(() => WorkoutCubit());
  sl.registerLazySingleton(() => RegisterBloc(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => ForgetPasswordBloc(sl(), sl(), sl(), sl()));
  //! Use cases
  sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(registerRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(
      () => ResetPasswordUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(() => CheckEmailUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => VerfiyEmailUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => ResendCodeUseCase(registerRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordVerifyEmailUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordResendCodeUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(loginRepository: sl()));
  sl.registerLazySingleton(
      () => RegisterWithGoogleUseCase(registerRepository: sl()));
  //! repositories
  sl.registerLazySingleton<ForgetPasswordRepository>(
      () => ForgetPasswordRepositoryImpl(forgetPasswordRemoteDataSource: sl()));
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: sl()));
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerRemoteDataSource: sl()));
  //! Data sources
  sl.registerLazySingleton<ForgetPasswordRemoteDataSource>(
      () => ForgetPasswordRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(apiConsumer: sl()));
}

Future<void> _app() async {
  //! Blocs or cubits
  sl.registerLazySingleton(() => ProfileBloc(sl()));
  sl.registerLazySingleton(() => EstateAddBloc(sl(), sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetUserUseCase(profileRepository: sl()));
  sl.registerLazySingleton(() => AddEstateUseCase(estateRepository: sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(estateRepository: sl()));
  //! repositories
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(profileDataSource: sl()));
  sl.registerLazySingleton<EstateRepository>(
      () => EstateRepositoryImpl(estateRemoteDataSource: sl()));
  //! Data sources
  sl.registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<EstateRemoteDataSource>(
      () => EstateRemoteDataSourceImpl(apiConsumer: sl()));
}
