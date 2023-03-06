import 'dart:io';

import 'package:d_commerce/constants/color.dart';
import 'package:d_commerce/constants/mediaquery.dart';
import 'package:d_commerce/screens/productScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageContainer extends StatelessWidget {
  String imageUri;
  double size;
  String? caption;
  String? captionImage;

  ImageContainer({
    super.key,
    required this.imageUri,
    required this.size,
    this.caption,
    this.captionImage,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(herotag: 'categories_herotag_0'),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUri),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: caption == null
            ? SizedBox(
                width: size,
                height: size,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(captionImage!),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: brownColor.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        )),
                    alignment: Alignment.center,
                    width: size,
                    child: Text(
                      caption ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
