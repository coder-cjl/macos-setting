import 'package:flutter/cupertino.dart';
import 'package:setting/pages/bluetooth/view.dart';
import 'package:setting/pages/network/view.dart';
import 'package:setting/pages/wifi/view.dart';

class HomeState {
  int currentIndex = 0;
  List<Widget> child = [
    const WifiPage(),
    BluetoothPage(),
    CupertinoTabView(builder: (_) => NetworkPage()),
  ];
}
