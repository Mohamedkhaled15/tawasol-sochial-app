import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../helpers/theme/app_colors.dart';

class CustomLoading extends StatelessWidget {
  final double size;
  final Color? color;
  const CustomLoading({
    Key? key,
    this.size = 40,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: color ?? AppColor.mainAppColor(),
      secondRingColor: color ?? AppColor.mainAppColor(),
      thirdRingColor: color ?? AppColor.mainAppColor(),
      size: size,
    );
  }
}
