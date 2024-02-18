import 'package:flutter/material.dart';

import 'no_network_widget.dart';

class NetworkConnectivityBuild {
  NetworkConnectivityBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: child ?? const SizedBox(),
          ),
          const NoNetworkWidget()
        ],
      ),
    );
  }
}
