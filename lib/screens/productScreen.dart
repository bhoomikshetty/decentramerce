import 'package:d_commerce/constants/appbar.dart';
import 'package:d_commerce/constants/button.dart';
import 'package:d_commerce/constants/color.dart';
import 'package:d_commerce/constants/container.dart';
import 'package:d_commerce/constants/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.herotag});
  String herotag;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final _animationController;
  bool showDescription = false;
  double _left = 16.0;
  double _top = 0.2 * 737.4545;
  late double _width = 0.2 * 737.4545;
  late double _height = 0.2 * 737.4545;
  double positions = 0;
  double _offset = 0.0;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 10));
    _scrollController.addListener(() {
      _offset = _scrollController.offset;
    });
  }

  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appbarConstants(
        color: positions > 210
            ? backgroundColor
            : backgroundColor.withOpacity(positions / 210),
        title: positions < 210
            ? Container()
            : ImageContainer(imageUri: 'assets/images/images.jpg', size: 64),
        trailing: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        trailingTapped: () {
          Navigator.pop(context);
        },
        action: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Icon(Icons.share),
            ),
            SizedBox(width: 0.05 * widthFunc(context, false)),
            Container(
              child: Icon(Icons.sort),
            ),
          ],
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          print(notification.metrics.outOfRange);
          setState(() {
            positions = _scrollController.positions.first.pixels;
            _scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse
                ? _top--
                : _top++;
          });
          return false;
        },
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              controller: _scrollController,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(bottom: 0.1 * heightFunc(context)),
                      height: 0.3 * heightFunc(context),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/images.jpg'),
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Product Name',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          'By Company Name',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 24.0),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showDescription = !showDescription;
                            });
                          },
                          child: Text(
                            "Im pretty sure that your app contains a lot of text: titles, descriptions, hints, etc. And not all of those texts are necessary for the user to see. So, sometimes, you want to hide part of them. A short description of a movie provides enough information for a user to decide if he wants to read more. And the common pattern is to truncate this text, maybe ellipsize it, to allow the user to expand it in some way (e.g. tapping on the whole text or on the ellipsis).",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: !showDescription ? 3 : 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showDescription = !showDescription;
                            });
                          },
                          child: Text(
                            "Im pretty sure that your app contains a lot of text: titles, descriptions, hints, etc. And not all of those texts are necessary for the user to see. So, sometimes, you want to hide part of them. A short description of a movie provides enough information for a user to decide if he wants to read more. And the common pattern is to truncate this text, maybe ellipsize it, to allow the user to expand it in some way (e.g. tapping on the whole text or on the ellipsis).",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: !showDescription ? 3 : 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showDescription = !showDescription;
                            });
                          },
                          child: Text(
                            "Im pretty sure that your app contains a lot of text: titles, descriptions, hints, etc. And not all of those texts are necessary for the user to see. So, sometimes, you want to hide part of them. A short description of a movie provides enough information for a user to decide if he wants to read more. And the common pattern is to truncate this text, maybe ellipsize it, to allow the user to expand it in some way (e.g. tapping on the whole text or on the ellipsis).",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: !showDescription ? 3 : 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showDescription = !showDescription;
                            });
                          },
                          child: Text(
                            "Im pretty sure that your app contains a lot of text: titles, descriptions, hints, etc. And not all of those texts are necessary for the user to see. So, sometimes, you want to hide part of them. A short description of a movie provides enough information for a user to decide if he wants to read more. And the common pattern is to truncate this text, maybe ellipsize it, to allow the user to expand it in some way (e.g. tapping on the whole text or on the ellipsis).",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: !showDescription ? 3 : 15,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 2),
              curve: Curves.linear,
              top: 0.2 * heightFunc(context),
              left: 16,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2),
                height: _offset == 0
                    ? _height
                    : _height / _offset > _height
                        ? _height
                        : _height / _offset,
                width: _offset == 0
                    ? _width
                    : _width / _offset > _width
                        ? _width
                        : _width / _offset,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(6.0),
                child: ImageContainer(
                  size: 0.2 * heightFunc(context),
                  imageUri: 'assets/images/images.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: ButtonConstants(
              child: const Text(
                'Buy',
              ),
              onPressed: () {})),
    );
  }
}
