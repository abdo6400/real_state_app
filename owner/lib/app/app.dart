import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/locale/app_localizations_setup.dart';
import '../config/routes/app_routes.dart';
import '../config/themes/app_theme.dart';
import '../core/bloc/global_cubit/locale_cubit.dart';
import '../core/bloc/global_cubit/theme_cubit.dart';
import '../core/components/map/presentation/cubit/map_cubit.dart';
import '../core/utils/app_strings.dart';
import '../features/estate_add/presentation/bloc/cubit/estate_cubit.dart';
import '../features/estate_add/presentation/bloc/estate_add_bloc.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';
import 'service_locator.dart';

class OwnerApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  const OwnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
    ));
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<LocaleCubit>()..getSavedLang()),
          BlocProvider(create: (context) => sl<ThemeCubit>()..getThemeMode()),
          BlocProvider(create: (context) => sl<MapCubit>()),
          BlocProvider(create: (context) => EstateCubit()),
          BlocProvider(
              create: (context) =>
                  sl<EstateAddBloc>()..add(GetCategoriesEvent())),
          BlocProvider(
              create: (context) => sl<ProfileBloc>()..add(GetUserEvent())),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, mode) {
            return BlocBuilder<LocaleCubit, LocaleState>(
                buildWhen: (previousState, currentState) {
              return previousState != currentState;
            }, builder: (context, state) {
              return ScreenUtilInit(
                  designSize: const Size(428, 926),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, _) {
                    return MaterialApp(
                      title: AppStrings.appName,
                      debugShowCheckedModeBanner: false,
                      builder: EasyLoading.init(),
                      themeMode: mode.themeMode,
                      theme: AppTheme.getApplicationLightTheme(),
                      darkTheme: AppTheme.getApplicationDarkTheme(),
                      navigatorKey: OwnerApp.navigatorKey,
                      onGenerateRoute: AppRoutes.onGenerateRoute,
                      locale: state.locale,
                      supportedLocales: AppLocalizationsSetup.supportedLocales,
                      localeResolutionCallback:
                          AppLocalizationsSetup.localeResolutionCallback,
                      localizationsDelegates:
                          AppLocalizationsSetup.localizationsDelegates,
                    );
                  });
            });
          },
        ));
  }
}

//./gradlew signingReport