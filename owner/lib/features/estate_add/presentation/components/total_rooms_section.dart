import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/cubit/estate_cubit.dart';

class TotalRoomsSection extends StatelessWidget {
  const TotalRoomsSection({super.key});
  // static const List<String> _titles = ["4", "5", "6", "7"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 14,
        ),
        Text(
          AppStrings.totalRooms.tr(context),
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: AppValues.font * 28, color: AppColors.blueDarK),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 14,
        ),
        SizedBox(
          height: AppValues.sizeHeight * 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RoomCard(
                title: context.read<EstateCubit>().roomTitles[index].toString(),
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: AppValues.sizeWidth * 12,
              );
            },
            itemCount: context.read<EstateCubit>().roomTitles.length,
          ),
        ),
      ],
    );
  }
}

class RoomCard extends StatelessWidget {
  final String title;
  final int index;
  const RoomCard({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final isSelected = index == context.watch<EstateCubit>().roomIndex;
    return GestureDetector(
      key: ValueKey(title.codeUnits),
      onTap: () => context.read<EstateCubit>().changeRoomIndex(index),
      child: Card(
        elevation: 0,
        color: isSelected ? AppColors.blueLight : AppColors.greySoft1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 28)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 28,
              vertical: AppValues.paddingHeight * 18),
          child: Row(
            children: [
              const Text(
                "🛋️",
                style: TextStyle(color: AppColors.blueDarK),
              ),
              SizedBox(
                width: AppValues.sizeWidth * 12,
              ),
              Text(
                " $title",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: AppValues.font * 16,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? AppColors.white : AppColors.blueDarK),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
