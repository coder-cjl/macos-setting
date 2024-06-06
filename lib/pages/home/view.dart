import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:setting/pages/bluetooth/view.dart';
import 'package:setting/pages/network/view.dart';
import 'package:setting/pages/second/view.dart';
import 'package:setting/pages/slider/view.dart';
import 'package:setting/pages/wifi/view.dart';
import 'logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final logic = HomeLogic();

  @override
  void initState() {
    logic.onInit();
    super.initState();
    logic.onReady();
  }

  @override
  void dispose() {
    logic.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      disableWallpaperTinting: true,
      sidebarState: NSVisualEffectViewState.active,
      sidebar: Sidebar(
        minWidth: 200,
        top: const MacosSearchField(
          placeholder: "Search",
        ),
        builder: (context, controller) {
          return SliderPage(
            onChanged: (index) {
              logic.state.currentIndex = index;
              setState(() {});
            },
          );
        },
      ),
      child: IndexedStack(
        index: logic.state.currentIndex,
        children: logic.state.child,
      ),
    );
  }
}
