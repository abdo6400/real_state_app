import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:page_transition/page_transition.dart';
import 'package:user/features/authentication/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:user/features/authentication/presentation/screens/forget_password/otp_forget_password_screen.dart';
import 'package:user/features/authentication/presentation/screens/forget_password/reset_password_screen.dart';
import 'package:user/features/authentication/presentation/screens/register/otp_screen.dart';
import 'package:user/features/authentication/presentation/screens/register/register_screen.dart';
import 'package:user/features/authentication/presentation/screens/register/user_information_screen.dart';
import 'package:user/core/components/basic_components/main_screen.dart';
import 'package:user/features/home/presentation/bloc/nearby_locations/nearby_locations_bloc.dart';
import 'package:user/features/home/presentation/bloc/top_locations/top_locations_bloc.dart';
import 'package:user/features/property/presentation/screens/estate_screen.dart';
import 'package:user/features/top_agent/presentation/screens/top_agents_screen.dart';
import 'package:user/features/top_location/presentation/screens/top_locations_screen.dart';
import '../../app/service_locator.dart';
import '../../core/components/map/presentation/screens/map_screen.dart';
import '../../core/utils/app_strings.dart';
import '../../features/authentication/presentation/bloc/cubit/information_cubit.dart';
import '../../features/authentication/presentation/bloc/forget_password/forget_password_bloc.dart';
import '../../features/authentication/presentation/bloc/login/login_bloc.dart';
import '../../features/authentication/presentation/bloc/register/register_bloc.dart';
import '../../features/authentication/presentation/bloc/timer/timer_cubit.dart';
import '../../features/authentication/presentation/screens/login/login_screen.dart';
import '../../core/components/basic_components/onboarding_screen.dart';
import '../../core/components/basic_components/splash_screen.dart';
import '../../features/favorite/presentation/bloc/favorite_bloc.dart';
import '../../features/home/presentation/bloc/categories/categories_bloc.dart';
import '../../features/home/presentation/bloc/top_owners/top_owners_bloc.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/property/presentation/bloc/cubit/estate_cubit.dart';

class Routes {
  //basic routes
  static const String initialRoute = '/';
  static const String mapRoute = '/mapRoute';
  static const String onBoardingRoute = "/onBoardingRoute";
  static const String loginRoute = "/loginRoute";
  static const String registerRoute = "/registerRoute";
  static const String informationRoute = "/informationRoute";
  static const String otpRegisterRoute = "/otpRegisterRoute";
  static const String otpForgetPasswordRoute = "/otpForgetPasswordRoute";
  static const String forgetPasswordRoute = "/forgetPasswordRoute";
  static const String resetPasswordRoute = "/resetPasswordRoute";
  static const String mainRoute = "/mainRoute";

  static const String changePasswordRoute = "/changePasswordRoute";
  static const String editProfileRoute = "/editProfileRoute";

  static const String estateRoute = "/estateRoute";
  static const String topLocationsRoute = "/topLocationsRoute";
  static const String topAgentsRoute = "/topAgentsRoute";
  static const String topAgentDetailsRoute = "/topAgentDetailsRoute";
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return PageTransition(
            child: const SplashScreen(),
            type: PageTransitionType.fade,
            settings: routeSettings);
      case Routes.onBoardingRoute:
        return PageTransition(
            child: const OnBoardingScreen(),
            type: PageTransitionType.fade,
            settings: routeSettings);
      case Routes.mapRoute:
        return PageTransition(
            child: const MapScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.loginRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<LoginBloc>()),
                BlocProvider.value(value: InformationCubit())
              ],
              child: const LoginScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.registerRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<RegisterBloc>()),
                BlocProvider.value(value: InformationCubit()),
              ],
              child: const RegisterScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.informationRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<RegisterBloc>()),
                BlocProvider.value(value: InformationCubit()),
              ],
              child: const UserInformationScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.otpRegisterRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<RegisterBloc>()),
                BlocProvider.value(value: WorkoutCubit()..startWorkout()),
              ],
              child: const OtpRegisterScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.otpForgetPasswordRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<ForgetPasswordBloc>()),
                BlocProvider.value(value: WorkoutCubit()..startWorkout()),
              ],
              child: const OtpForgetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.forgetPasswordRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<ForgetPasswordBloc>()),
              ],
              child: const ForgetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.resetPasswordRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<ForgetPasswordBloc>()),
                BlocProvider.value(value: InformationCubit()),
              ],
              child: const ResetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.mainRoute:
        return PageTransition(
            child: MultiBlocProvider(providers: [
              BlocProvider.value(value: sl<ProfileBloc>()..add(GetUserEvent())),
              BlocProvider.value(
                  value: sl<TopLocationsBloc>()..add(GetTopLocationsEvent())),
              BlocProvider.value(
                  value: sl<NearbyLocationsBloc>()
                    ..add(const GetNearbyLocationsEvent(location: []))),
              BlocProvider.value(
                  value: sl<TopOwnersBloc>()..add(GetTopOwnersEvent())),
              BlocProvider.value(
                  value: sl<CategoriesBloc>()..add(GetCategoriesEvent())),
              BlocProvider.value(
                  value: sl<FavoriteBloc>()..add(GetFavoriteEvent())),
            ], child: const MainScreen()),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.topAgentsRoute:
        return PageTransition(
            child: const TopAgentsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.topLocationsRoute:
        return PageTransition(
            child: const TopLocationsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.estateRoute:
        return PageTransition(
            child:  BlocProvider(
              create: (context) => EstateCubit(),
              child: const EstateScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
