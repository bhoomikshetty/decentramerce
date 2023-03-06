import 'dart:async';

import 'package:d_commerce/main.dart';
import 'package:d_commerce/services/sharedPrefServices.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class Authentication {
  static SessionStatus? session;
  static List<String> accounts = [];
  static StreamController<List<String>> controller =
      StreamController<List<String>>();

  static WalletConnect connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'Decommerce',
          description: 'Decentralized Marketplace for luxury goods.',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  static Future<SessionStatus?> loginUsingMetamask() async {
    if (!connector.connected) {
      try {
        SessionStatus session = connector.bridgeConnected
            ? await connector.connect(
                chainId: 137,
                onDisplayUri: (uri) async {
                  await launchUrlString(uri,
                      mode: LaunchMode.externalApplication);
                })
            : await connector.createSession(
                chainId: 137,
                onDisplayUri: (uri) async {
                  await launchUrlString(uri,
                      mode: LaunchMode.externalApplication);
                });
        controller.add(connector.session.accounts);
        Authentication.accounts = connector.session.accounts;
        print(connector.session.accounts.toString());
        SharedPreferenceServices.pref!
            .setString('sessionAccount', session.accounts.first);
        return session;
      } catch (e) {
        print(e);
        return null;
      }
    }
    return null;
  }
}
