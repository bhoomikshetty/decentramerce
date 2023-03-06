import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:d_commerce/constants/appbar.dart';
import 'package:d_commerce/constants/container.dart';
import 'package:d_commerce/constants/mediaquery.dart';
import 'package:d_commerce/screens/productScreen.dart';
import 'package:d_commerce/shared/horizontalScrollWidget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<String> categories = ['Categories', 'Categories', 'Categories'];
  aFunc(String heroTag) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(herotag: heroTag),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbarConstants(
          height: 48,
          color: Colors.transparent,
          title: SvgPicture.asset(
            'assets/images/metamask_logo.svg',
            color: Colors.white,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            sliverAppbarConstants(
                title: Row(
              children: [],
            )),
            SliverAnimatedList(
              initialItemCount: categories.length,
              itemBuilder: (context, ind, animation) {
                return HorizontalScrollWidget(
                    title: categories[ind],
                    height: ind == 0
                        ? 0.3 * heightFunc(context)
                        : 0.2 * heightFunc(context),
                    children: List.generate(
                      15,
                      (index) => GestureDetector(
                        onTap: () {
                          aFunc('categories_herotag_$index');
                        },
                        child: ImageContainer(
                          captionImage: 'assets/images/images.jpg',
                          caption: 'Account Holder',
                          size: ind == 0
                              ? 0.3 * heightFunc(context)
                              : 0.2 * heightFunc(context),
                          imageUri: "assets/images/images.jpg", 
                        ),
                      ),
                    ));
                // HorizontalScrollWidget(
                //     title: 'Top Featured',
                //     height: 0.2 * heightFunc(context),
                //     children: List.generate(
                //       15,
                //       (index) => ImageContainer(
                //           onTap: () {},
                //           captionImage: 'assets/images/images.jpg',
                //           caption: 'Account Holder',
                //           size: 0.2 * heightFunc(context),
                //           imageUri: "assets/images/images.jpg"),
                //     )),
                // HorizontalScrollWidget(
                //     title: 'Top Featured',
                //     height: 0.2 * heightFunc(context),
                //     children: List.generate(
                //       15,
                //       (index) => ImageContainer(
                //           onTap: () {},
                //           captionImage: 'assets/images/images.jpg',
                //           caption: 'Account Holder',
                //           size: 0.2 * heightFunc(context),
                //           imageUri: "assets/images/images.jpg"),
                //     )),
              },
            )
          ],
        ),
      ),
    );
  }
}

// ListView(
//         scrollDirection: Axis.vertical,
//         children: [
          
//         ],
//       ),
