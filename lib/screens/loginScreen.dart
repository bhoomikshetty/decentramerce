import 'package:d_commerce/constants/button.dart';
import 'package:d_commerce/constants/color.dart';
import '../services/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/mediaquery.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.only(bottom: 0.05 * heightFunc(context)),
        alignment: Alignment.bottomCenter,
        child: ButtonConstants(
            onPressed: Authentication.loginUsingMetamask,
            child: SvgPicture.asset('assets/images/metamask_logo.svg')),
      ),
    );
  }
}
