import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class barcodeScanner {
  static Future<String> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Kapat', true, ScanMode.QR);
      print('saaaaaaaaaaaaaaa');
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = '';
    }

    if (barcodeScanRes == "" || barcodeScanRes == "-1") {
      return "";
    } else {
      return barcodeScanRes;
    }
  }
}
