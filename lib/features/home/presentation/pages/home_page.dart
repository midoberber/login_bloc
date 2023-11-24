import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_with_bloc/core/constant/colors.dart';
import 'package:login_with_bloc/core/constant/images.dart';
import 'package:login_with_bloc/core/constant/styles/styles.dart';
import 'package:login_with_bloc/core/cubit_main/bloc_main_cubit.dart';
import 'package:login_with_bloc/core/utils/sizedbox_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var mainCubit = context.read<BlocMainCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(person), fit: BoxFit.fill),
                  ),
                ),
                20.sizeWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainCubit.repository.loadAppData()!.displayName!,
                      style:
                          TextStyles.textViewBold16.copyWith(color: textColor),
                    ),
                    Text(
                      mainCubit.repository.loadAppData()!.phone!,
                      style: TextStyles.textViewMedium12
                          .copyWith(color: textColor),
                    ),
                  ],
                )
              ],
            ),
            30.sizHeight,
            SizedBox(height: 300.h, child: SvgPicture.asset(heeloImageSvg)),
          ],
        ),
      ),
    );
  }
}
