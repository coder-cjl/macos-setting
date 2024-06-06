import 'package:setting/pages/slider/model.dart';

class SliderState {
  List groups = [];

  int currentIndex = 0;

  List<SliderItem> networks = [
    SliderItem(name: "Wi-Fi"),
    SliderItem(name: "蓝牙"),
    SliderItem(name: "网络"),
  ];

  List<SliderItem> alerts = [
    SliderItem(name: "通知"),
    SliderItem(name: "声音"),
    SliderItem(name: "专注模式"),
    SliderItem(name: "屏幕使用时间"),
  ];
}
