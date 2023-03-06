import 'dart:async';

import 'package:d_commerce/constants/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HorizontalScrollWidget extends StatefulWidget {
  double height;
  List<Widget> children;
  String? title;
  HorizontalScrollWidget(
      {required this.children, required this.height, this.title});
  @override
  State<HorizontalScrollWidget> createState() => _HorizontalStateScrollWidget();
}

class _HorizontalStateScrollWidget extends State<HorizontalScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        height: widget.height,
        width: widthFunc(context, false),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                alignment: Alignment.topLeft,
                child: Text(
                  widget.title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.children.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: widget.children[index]);
                  },
                ),
              ),
            ]));
  }
}
