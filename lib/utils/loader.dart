import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loader {
  static void show({String? status, bool? isAutoDismiss}) {
    // Intercept the back button
    BackButtonInterceptor.add(interceptor);
    bool dismis = isAutoDismiss ?? false;

    // Show the loader

    EasyLoading.show(
      status: status,
      maskType: EasyLoadingMaskType.black,
    );

    if (dismis) {
      Future.delayed(Duration(seconds: 2), () {
        EasyLoading.dismiss();
      });
    }
  }

  static void dismiss() {
    // Dismiss the loader
    EasyLoading.dismiss();

    // Dismiss the back button interceptor
    BackButtonInterceptor.remove(interceptor);
  }

  // Back button interceptor function
  static bool interceptor(bool stopEvent, RouteInfo info) {
    // Do whatever you want when intercepting the back button
    return true;
  }
}
