import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_values.dart';

class OtpInputSection extends StatelessWidget {
  final String secureKey;
  final String email;
  final Function function;
  const OtpInputSection(
      {super.key,
      required this.secureKey,
      required this.email,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 100,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            keyboardType: TextInputType.number,
            pinAnimationType: PinAnimationType.slide,
            onTapOutside: (event) => context.closeKeyboard(),
            showCursor: true,
            onCompleted: (value) => function(value),
            preFilledWidget: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: AppValues.sizeWidth * 40,
                  height: AppValues.sizeHeight * 3,
                  decoration: BoxDecoration(
                    color: AppColors.hintColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: AppValues.sizeWidth * 40,
                  height: AppValues.sizeHeight * 3,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            defaultPinTheme: PinTheme(
              width: AppValues.sizeWidth * 80,
              height: AppValues.sizeHeight * 80,
              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(),
              decoration: const BoxDecoration(
                
              ),
            ),
          ),
        ),
      ],
    );
  }
}
