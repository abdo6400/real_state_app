import 'package:flutter/material.dart';
import 'package:user/core/components/app_components/products__views/products_listview.dart';
import 'package:user/core/components/default_components/default_appbar.dart';
import 'package:user/core/components/default_components/default_message_card.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../components/filter_options_card.dart';
import '../components/search_appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppBar(
          addLang: false,
          addLeadingButton: true,
          leading: GestureDetector(
              onTap: () {
                context.showBottomSheet(
                    isDismissible: true,
                    function: () {},
                    buttonLabel: AppStrings.applyFilter,
                    child: const FilterOptionsCard(),
                    maxHeight: AppValues.sizeHeight * 800);
              },
              child: Icon(Icons.tune_outlined)),
          appBarText: AppStrings.search,
        ),
        body: Column(
          children: [
            const SearchAppBar(),
            Expanded(
                child: (false)
                    ? ProductsListView(items: [], loading: false)
                    : const DefaultMessageCard(
                        sign: "!",
                        subTitle: AppStrings.searchNotFoundSorry,
                        title: AppStrings.searchNotFound,
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
