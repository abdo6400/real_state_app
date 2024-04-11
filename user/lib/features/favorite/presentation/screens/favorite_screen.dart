import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/utils/app_strings.dart';
import 'package:user/features/favorite/presentation/bloc/favorite_bloc.dart';
import '../../../../core/components/app_components/products__views/product_vertical_card.dart';
import '../../../../core/components/default_components/default_appbar.dart';
import '../../../../core/components/default_components/default_loaders.dart';
import '../../../../core/components/default_components/default_message_card.dart';
import '../../../../core/utils/app_values.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        addLang: false,
        addLeadingButton: false,
        appBarText: AppStrings.favorite,
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return state is FavoriteDataLoadedState && state.properties.isEmpty
              ? const DefaultMessageCard(
                  sign: '0_0',
                  title: AppStrings.yourListingIsEmpty,
                  subTitle: AppStrings.favorite,
                )
              : GridView.builder(
                  itemCount: state is FavoriteDataLoadedState
                      ? state.properties.length
                      : 6,
                  padding: EdgeInsets.only(
                      bottom: AppValues.paddingHeight * 50,
                      right: AppValues.paddingWidth * 20,
                      left: AppValues.paddingWidth * 20),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: (AppValues.sizeHeight * 280),
                      crossAxisSpacing: AppValues.sizeWidth * 12,
                      mainAxisSpacing: AppValues.sizeHeight * 12,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return state is FavoriteDataLoadedState
                        ? ProductVerticalCard(
                            item: state.properties[index],
                          )
                        : ShimmerLoader(
                            width: double.infinity,
                            borderRadius: AppValues.radius * 28,
                          );
                  });
        },
      ),
    );
  }
}
