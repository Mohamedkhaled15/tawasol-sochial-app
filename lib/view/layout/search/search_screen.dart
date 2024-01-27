import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:templet/helpers/images/app_images.dart';
import 'package:templet/helpers/locale/app_locale_key.dart';
import 'package:templet/helpers/theme/app_colors.dart';
import 'package:templet/helpers/theme/app_text_style.dart';
import 'package:templet/view/custom_widgets/custom_app_bar/custom_app_bar.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'SearchScreen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchEC = TextEditingController();
  late FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
    // Request focus when the screen is first loaded
    searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    // Dispose the focus node when it's no longer needed
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:
            Text(tr(AppLocaleKey.searchUser), style: AppTextStyle.textD18B()),
        centerTitle: false,
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: Container(
                color: AppColor.whiteColor(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchBar(
                        focusNode: searchFocusNode,
                        padding: MaterialStateProperty.resolveWith((states) =>
                            const EdgeInsets.symmetric(horizontal: 20)),
                        controller: searchEC,
                        onChanged: (value) {
                          setState(() {
                            searchEC.text = value;
                          });
                        },
                        onTap: () {},
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 1),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => AppColor.whiteColor()),
                        leading: const Icon(Icons.search_rounded),
                        hintText: tr(AppLocaleKey.typeUserName),
                        hintStyle: MaterialStateProperty.resolveWith(
                            (states) => AppTextStyle.hintStyle()),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                side: BorderSide(
                                    color: AppColor.purpleColor(), width: 2))),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .where('userName', isEqualTo: searchEC.text)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                                "${tr(AppLocaleKey.showSearchResult)}'${searchEC.text}");

                            // return const Center(
                            //     child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return searchEC.text == ''
                                ? const Text('')
                                : Text('No results found for ${searchEC.text}');
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                dynamic item =
                                    snapshot.data!.docs[index].data();
                                return ListTile(
                                  leading: item['profilePic'] == ''
                                      ? const CircleAvatar(
                                          backgroundImage:
                                              AssetImage(AppImages.man),
                                        )
                                      : CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(item['profilePic']),
                                        ),
                                  title: Text(item['userName']),
                                  subtitle: Text(item['email']),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
