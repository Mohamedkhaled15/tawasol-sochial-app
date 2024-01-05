import 'package:flutter/material.dart';

import '../custom_widgets/page_container/page_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const PageContainer(
      child: Scaffold(),
    );
  }
}
