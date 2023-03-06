import 'dart:async';
import 'dart:ffi';

import 'package:d_commerce/screens/fragment.dart';
import 'package:d_commerce/screens/homepageScreen.dart';
import 'package:d_commerce/screens/loginScreen.dart';
import 'package:d_commerce/services/authentication/authentication.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import './services/sharedPrefServices.dart';
import 'main.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: Authentication.controller.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Fragment();
        }
        return snapshot.data!.isNotEmpty
            ? const Fragment()
            : const LoginScreen();
      },
    );
  }
}
