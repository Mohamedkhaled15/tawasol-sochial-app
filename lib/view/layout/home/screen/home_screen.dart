import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:templet/helpers/images/app_images.dart';
import 'package:templet/helpers/locale/app_locale_key.dart';
import 'package:templet/helpers/theme/app_colors.dart';
import 'package:templet/helpers/theme/app_text_style.dart';
import 'package:templet/helpers/utils/date_methods.dart';
import 'package:templet/view/custom_widgets/custom_form_field/custom_form_field.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          AppColor.textFormColor().withOpacity(0.1),
                      child: SvgPicture.asset(AppImages.sendIcon),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CustomFormField(
                        radius: 25,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            AppImages.searchIcon,
                            colorFilter: ColorFilter.mode(
                              AppColor.thirdAppColor(),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        hintText: tr(AppLocaleKey.search),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                controller: tabController,
                labelColor: AppColor.purpleColor(),
                unselectedLabelColor: AppColor.greyColor(),
                indicatorColor: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                labelStyle: AppTextStyle.textM20B(),
                indicator: BoxDecoration(
                  color: AppColor.thirdAppColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: [
                  Tab(
                    text: tr(AppLocaleKey.popular),
                  ),
                  Tab(
                    text: tr(AppLocaleKey.tending),
                  ),
                  Tab(
                    text: tr(AppLocaleKey.following),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: AppColor.greyColor().withOpacity(0.2),
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      PostList(),
                      PostList(),
                      PostList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    return FutureBuilder(
        future: posts.get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            dynamic data = snapshot.data! as dynamic;
            return ListView.builder(
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Expanded(
                                    //     child: Text(
                                    //       DateMethods.formatToDate(
                                    //         data.docs[index]['date'] as String))),
                                    Text(tr(data.docs[index]['userName'])),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      AppImages.man,
                                      scale: 15,
                                    )
                                  ]),
                            ),
                            Text(data.docs[index]['description']),
                            Image.network(data.docs[index]['postImage']),
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
                                  child: SvgPicture.asset(
                                      AppImages.plusCircleIcon),
                                ),
                              ],
                            )
                          ])),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
