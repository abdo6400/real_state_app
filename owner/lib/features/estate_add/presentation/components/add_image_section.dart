import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/cubit/estate_cubit.dart';
import '../bloc/cubit/estate_state.dart';


class AddImageSection extends StatelessWidget {
  const AddImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Text(
        //   AppStrings.listingPhotos.tr(context),
        //   style: Theme.of(context).textTheme.titleMedium,
        // ),
        // SizedBox(
        //   height: AppValues.s20.h,
        // ),
        SizedBox(
          height: AppValues.sizeHeight*100,
          width: ScreenUtil().screenWidth,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BlocConsumer<EstateCubit, EstateState>(
                    listener: (context, state) {},
                    buildWhen: (previous, state) {
                      return state is ImagesListState ||
                          state is ImagesListChangedState;
                    },
                    builder: (context, state) {
                      final images = context.read<EstateCubit>().images;
                      return Row(
                        children: [
                          ListView.separated(
                              itemCount: images.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: AppValues.sizeWidth*12,
                                );
                              },
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<EstateCubit>()
                                        .removeImage(images[index]);
                                  },
                                  child: Container(
                                    width: AppValues.sizeWidth*100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(images[index].path))),
                                        borderRadius: BorderRadius.circular(
                                            AppValues.radius*12)),
                                  ),
                                );
                              }),
                          SizedBox(
                            width: images.isNotEmpty ? AppValues.sizeWidth*12 : 0,
                          ),
                        ],
                      );
                    }),
                GestureDetector(
                  onTap: () {
                    context.read<EstateCubit>().addImage();
                  },
                  child: SizedBox(
                    width: AppValues.sizeWidth*90,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.greySoft1,
                          borderRadius: BorderRadius.circular(AppValues.radius*20)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppValues.paddingWidth*12,
                            vertical: AppValues.paddingHeight*12),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: AppValues.font*36,
                            color: AppColors.blueDarK.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
