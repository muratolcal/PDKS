// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:teknopark_pdks/network_controller/network_connectivity.dart';
import 'package:teknopark_pdks/network_controller/null_page_view.dart';
import 'package:flutter/material.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({Key? key});

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;
  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();

    waitForScreen(() {
      _networkChange.handleNetworkChange((result) {
        print(result);
        _updateView(result);
      });
    });
  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: _networkResult == NetworkResult.off
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              child: nullPageView(
                context,
                "assets/images/wifi.png",
                "Bir şeyler yanlış gitti",
                "İnternet bağlantınızı kontrol ediniz.",
              ),
            )
          : const SizedBox(),
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
