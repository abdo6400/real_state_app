import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/features/home/presentation/bloc/categories/categories_bloc.dart';
import '../../../../core/components/default_components/default_loaders.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import 'custom_topbar_section.dart';
import 'type_card.dart';

class TypesSection extends StatelessWidget {
  const TypesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopBarSection(
            title: AppStrings.categories,
            subTitle: AppStrings.viewAll,
            addButton: false,
            function: () {}),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        SizedBox(
            height: AppValues.sizeHeight * 70,
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return state is GetAllCategoriesLoadedState
                          ? TypeCard(
                              category: state.categories[index], index: index)
                          : ShimmerLoader(
                              width: AppValues.sizeWidth * 90,
                              borderRadius: AppValues.radius * 28,
                            );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: AppValues.sizeWidth * 12,
                      );
                    },
                    itemCount: state is GetAllCategoriesLoadedState
                        ? state.categories.length
                        : 5);
              },
            )),
      ],
    );
  }
}
