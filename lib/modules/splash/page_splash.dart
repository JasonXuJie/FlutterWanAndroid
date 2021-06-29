import 'package:Inke/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:Inke/config/colors.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:Inke/widgets/widget_icon.dart';
import 'package:Inke/widgets/text.dart';

class SplashPage extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorPrimary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconWidget(
              callBack: () {
                controller.jump2Guide();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: AppColors.color_0099fd,
                child: Text(
                  'WanAndroid',
                  style: TextStyles.whiteBold14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
