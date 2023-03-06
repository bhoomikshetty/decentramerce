import 'package:d_commerce/constants/color.dart';
import 'package:d_commerce/screens/homepageScreen.dart';
import 'package:flutter/material.dart';

import '../constants/appbar.dart';

class Fragment extends StatefulWidget {
  const Fragment({super.key});

  @override
  State<Fragment> createState() => _FragmentState();
}

class _FragmentState extends State<Fragment> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const BouncingScrollPhysics(),
        children: [
          HomePageScreen(),
          HomePageScreen(),
          HomePageScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 48,
        child: appbarConstants(
          title: Text("title"),
          color: brownColor,
        ),
      ),
    );
  }
}
