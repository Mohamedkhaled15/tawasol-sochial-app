import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../helpers/theme/app_colors.dart';
import '../custom_app_bar/custom_app_bar.dart';
import '../custom_loading/custom_loading.dart';

class ZoomImageScreen extends StatefulWidget {
  final String image;
  const ZoomImageScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  static const String routeName = 'ZoomImageScreen';

  @override
  State<ZoomImageScreen> createState() => _ZoomImageScreenState();
}

class _ZoomImageScreenState extends State<ZoomImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          padding: const EdgeInsets.all(5),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColor.whiteColor(),
          ),
        ),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(widget.image),
        loadingBuilder: (context, event) {
          return const Center(
            child: CustomLoading(),
          );
        },
      ),
    );
  }
}
