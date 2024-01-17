import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:templet/global/services/cloud.dart';
import 'package:templet/helpers/images/app_images.dart';
import 'package:templet/helpers/images/image_methods.dart';
import 'package:templet/helpers/locale/app_locale_key.dart';
import 'package:templet/helpers/theme/app_colors.dart';
import 'package:templet/helpers/theme/app_text_style.dart';
import 'package:templet/view/custom_widgets/custom_app_bar/custom_app_bar.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = 'AddPostScreen';

  AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? file;
  String? image;
  TextEditingController descriptionEC = TextEditingController();
  uploadPost() async {
    try {
      String res = await CloudMethods().uploadPost(
          description: descriptionEC.text,
          uid: 'fRXC2E3Oi0gfmM1oEcxVPPrfqN73',
          username: "Mohamed khaled",
          file: file ?? File(''),
          displayName: '123456789');
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        title: Text(tr(AppLocaleKey.addPost), style: AppTextStyle.textD18B()),
        actions: [
          TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                const CircleBorder(),
              )),
              onPressed: () {
                uploadPost();
                Navigator.pop(context);
              },
              child:
                  Text(tr(AppLocaleKey.post), style: AppTextStyle.textD18B()))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              AppImages.man,
              scale: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: TextField(
              controller: descriptionEC,
              maxLines: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: tr(AppLocaleKey.writeSomething),
              ),
            ))
          ]),
          Expanded(
            child: file != null
                ? Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      image: DecorationImage(
                        image: FileImage(File(image!)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20)),
              onPressed: () {
                ImageMethods.pickImage(
                    source: ImageSource.gallery,
                    onSuccess: (images) {
                      setState(() {
                        file = images;
                        image = images.path;
                      });
                    });
              },
              child: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(AppColor.whiteColor(), BlendMode.srcIn),
                AppImages.cameraIcon,
              )),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}
