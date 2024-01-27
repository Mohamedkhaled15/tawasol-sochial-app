import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:templet/helpers/theme/app_colors.dart';
import 'package:templet/helpers/theme/app_text_style.dart';
import 'package:templet/view/layout/home/widgets/post_list.dart';
import 'package:templet/helpers/locale/app_locale_key.dart';
import 'package:templet/view/layout/home/widgets/search_widget.dart';

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
    FocusScope.of(context).unfocus();
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                primary: true,
                backgroundColor: AppColor.whiteColor(),
                flexibleSpace: FlexibleSpaceBar(
                    background: isScrolled
                        ? const SizedBox.shrink()
                        : SearchWidget(
                            enableTyping: true,
                            enableNavigate: true,
                            borderColor: AppColor.offWhiteColor(),
                          ),
                    title: const Padding(
                      padding: EdgeInsets.only(top: 40),
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: tabController,
                    labelColor: AppColor.purpleColor(),
                    unselectedLabelColor: AppColor.greyColor(),
                    indicatorColor: Colors.transparent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
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
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: const [
              PostList(),
              PostList(),
              PostList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColor.greyColor().withOpacity(0.2),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
