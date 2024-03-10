import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectitivyIcon extends StatelessWidget {
  const ConnectitivyIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return snapshot.data == ConnectivityResult.none
              ? const Icon(
                  Icons.wifi_off,
                  color: Colors.red,
                )
              : const SizedBox();
        });
  }
}
