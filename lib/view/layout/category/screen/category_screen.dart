import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:tawasol/helpers/images/app_images.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = 'CategoryScreen';
  CategoryScreen({super.key});
  final List<String> images = [
    AppImages.man,
    AppImages.woman,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ImageStack(
            imageSource: ImageSource.Asset,
            imageList: images,
            totalCount: images.length,
            imageRadius: 100,
            imageCount: 2,
            imageBorderWidth: 3,
            showTotalCount: true,
          ),
        ],
      ),
    );
  }
}
