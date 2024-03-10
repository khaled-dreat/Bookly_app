import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/api/api_service.dart';

class ConnectitivyIcon extends StatefulWidget {
  const ConnectitivyIcon({
    super.key,
  });

  @override
  State<ConnectitivyIcon> createState() => _ConnectitivyIconState();
}

class _ConnectitivyIconState extends State<ConnectitivyIcon> {
  @override
  void initState() {
    super.initState();
    ApiService.checkConnectitivy();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.data == ConnectivityResult.none ||
              snapshot.data == null) {
            return const Icon(
              Icons.wifi_off,
              color: Colors.red,
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
