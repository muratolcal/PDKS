import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static dynamic user;
  static dynamic appStatus;

  static void setShared(String name, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(name, value.toString());
  }

  static dynamic getShared(String name) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(name);
  }

  static bool isTcValid(String tcNo) {
    String kimlikno = tcNo;
    int tipTenT = 0;
    int tipTenC = 0;
    int tipEleven = 0;
    dynamic tipList = kimlikno.split('').toList();

    if (kimlikno.length == 11) {
      for (int i = 1; i <= 9; i++) {
        if (i == 1) {
          tipTenT += int.parse(tipList[0].toString());
        } else {
          if (i % 2 == 0) {
            tipTenC += int.parse(tipList[i - 1].toString());
          } else {
            tipTenT += int.parse(tipList[i - 1].toString());
          }
        }
      }
      int calculTenMod = ((tipTenT * 7) - tipTenC) % 10;
      for (int i = 0; i < 10; i++) {
        tipEleven += int.parse(tipList[i].toString());
      }
      int calculElevenMod = tipEleven % 10;
      if (calculTenMod != int.parse(tipList[9].toString()) ||
          calculElevenMod != int.parse(tipList[10].toString())) {
        return false;
      }
    } else {
      return false;
    }
    return true;
  }
}

class Debouncer {
  late int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
