import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tawasol/helpers/images/app_images.dart';
import 'package:tawasol/helpers/theme/app_colors.dart';
import 'package:tawasol/helpers/theme/app_text_style.dart';
import 'package:tawasol/helpers/utils/date_methods.dart';
import 'package:tawasol/view/custom_widgets/custom_network_image/custom_network_image.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.index, required this.data});
  final int index;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          decoration: BoxDecoration(
              color: AppColor.whiteColor(),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColor.blackColor().withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    data.docs[index]['postImage'] != ""
                        ? Image.asset(
                            AppImages.man,
                            scale: 15,
                          )
                        : Image.network(data.docs[index]['profilePic']),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(tr(data.docs[index]['userName'])),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateMethods.formatToDate(
                              data.docs[index]['date'].toDate().toString()),
                          style: AppTextStyle.textL14M(),
                        ),
                        Text(
                          DateMethods.formatToTime(
                              data.docs[index]['date'].toDate().toString()),
                          style: AppTextStyle.textL14M(),
                        ),
                      ],
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.docs[index]['description'],
                  ),
                ),
                data.docs[index]['postImage']?.isEmpty
                    ? Container()
                    : CustomNetworkImage(
                        imageUrl: data.docs[index]['postImage']),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(AppImages.heartIcon),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('125'),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(AppImages.chatIcon),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('20'),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(AppImages.plusCircleIcon),
                    ),
                  ],
                )
              ])),
    );
  }
}
