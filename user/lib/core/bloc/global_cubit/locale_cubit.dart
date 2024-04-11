import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/utils/app_enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../app/service_locator.dart';
import '../../../config/database/cache/cache_consumer.dart';
part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final currentLangCode = await sl<CacheConsumer>()
            .getStringData(key: MySharedKeys.language.name) ??
        AppStrings.englishCode;
    if (currentLangCode == null) {
      sl<CacheConsumer>().saveData(
          key: MySharedKeys.language.name, value: AppStrings.englishCode);
    }
    emit(ChangeLocaleState(Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    sl<CacheConsumer>()
        .saveData(key: MySharedKeys.language.name, value: langCode);
    currentLangCode = langCode;

    emit(ChangeLocaleState(Locale(currentLangCode)));
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toArabic() => _changeLang(AppStrings.arabicCode);
}
